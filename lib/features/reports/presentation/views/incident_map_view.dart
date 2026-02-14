import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/map_controller.dart';

import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:ballot_eye/core/utils/app_constants.dart';
import 'package:ballot_eye/shared/widgets/glass_container.dart';

class IncidentMapView extends ConsumerStatefulWidget {
  const IncidentMapView({super.key});

  @override
  ConsumerState<IncidentMapView> createState() => _IncidentMapViewState();
}

class _IncidentMapViewState extends ConsumerState<IncidentMapView> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  String? _selectedCategory;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = ref.read(locationServiceProvider);
    try {
      final pos = await location.getCurrentLocation();
      if (mounted) {
        setState(() => _currentPosition = LatLng(pos.latitude, pos.longitude));
      }
    } catch (_) {}
  }

  void _onCameraIdle() async {
    if (_mapController == null) return;
    final bounds = await _mapController!.getVisibleRegion();
    ref.read(mapControllerProvider.notifier).updateBounds(
      bounds,
      category: _selectedCategory,
      status: _selectedStatus,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportsAsync = ref.watch(mapControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: GlassContainer(
          borderRadius: 0,
          opacity: 0.1,
          blur: 10,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(AppConstants.mapTitle),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list_rounded),
                onPressed: _showFilters,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition ?? const LatLng(23.6850, 90.3563), // Default to Bangladesh
              zoom: 12,
            ),
            onMapCreated: (controller) => _mapController = controller,
            onCameraIdle: _onCameraIdle,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _buildMarkers(reportsAsync.value ?? []),
            circles: _buildHotspots(reportsAsync.value ?? []),
          ),
          if (reportsAsync.isLoading)
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Center(
                child: GlassContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Syncing incidents...',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );

  }

  Set<Marker> _buildMarkers(List<IncidentReport> reports) {
    return reports.map((report) {
      return Marker(
        markerId: MarkerId(report.id),
        position: LatLng(report.latitude, report.longitude),
        onTap: () => _showReportPreview(report),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          _getMarkerHue(report.category),
        ),
      );
    }).toSet();
  }

  Set<Circle> _buildHotspots(List<IncidentReport> reports) {
    // Basic heatmap simulation: Show circles for clusters
    // For MVP, we'll just show a light circle around each marker to indicate "presence"
    return reports.map((report) {
      return Circle(
        circleId: CircleId('hotspot_${report.id}'),
        center: LatLng(report.latitude, report.longitude),
        radius: 200,
        fillColor: Colors.red.withOpacity(0.1),
        strokeWidth: 0,
      );
    }).toSet();
  }

  double _getMarkerHue(String category) {
    switch (category.toLowerCase()) {
      case 'violence': return BitmapDescriptor.hueRed;
      case 'fraud': return BitmapDescriptor.hueOrange;
      case 'bribery': return BitmapDescriptor.hueYellow;
      default: return BitmapDescriptor.hueBlue;
    }
  }

  void _showReportPreview(IncidentReport report) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _ReportPreviewSheet(report: report),
    );
  }

  void _showFilters() {
    // Simplified filter selection for MVP
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(title: Text('Filter Incidents', style: TextStyle(fontWeight: FontWeight.bold))),
          ListTile(
            title: const Text('Clear Filters'),
            onTap: () {
              setState(() {
                _selectedCategory = null;
                _selectedStatus = null;
              });
              Navigator.pop(context);
              _onCameraIdle();
            },
          ),
          // Add category options...
        ],
      ),
    );
  }
}

class _ReportPreviewSheet extends StatelessWidget {
  final IncidentReport report;
  const _ReportPreviewSheet({required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(report.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          const SizedBox(height: 8),
          Text(report.category, style: const TextStyle(color: Colors.blue)),
          const SizedBox(height: 12),
          Text(report.description, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.go('/reports/detail/${report.id}');
              },
              child: const Text('VIEW FULL DETAILS'),
            ),
          ),
        ],
      ),
    );
  }
}
