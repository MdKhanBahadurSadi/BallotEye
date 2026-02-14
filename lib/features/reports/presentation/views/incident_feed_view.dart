import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/reports_feed_controller.dart';
import 'package:ballot_eye/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ballot_eye/shared/widgets/ui_state_widgets.dart';
import 'package:ballot_eye/core/utils/app_constants.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:ballot_eye/shared/widgets/ui_state_widgets.dart';
import 'package:ballot_eye/shared/widgets/glass_container.dart';

class IncidentFeedView extends ConsumerStatefulWidget {
  const IncidentFeedView({super.key});

  @override
  ConsumerState<IncidentFeedView> createState() => _IncidentFeedViewState();
}

class _IncidentFeedViewState extends ConsumerState<IncidentFeedView> {
  final _scrollController = ScrollController();
  String _searchQuery = '';
  String? _selectedCategory;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      ref.read(reportsFeedControllerProvider(
        category: _selectedCategory,
        status: _selectedStatus,
      ).notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final reportsAsync = ref.watch(reportsFeedControllerProvider(
      category: _selectedCategory,
      status: _selectedStatus,
    ));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: GlassContainer(
          borderRadius: 0,
          opacity: 0.1,
          blur: 20,
          border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        AppConstants.feedTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_outlined),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search incidents...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      isDense: true,
                      fillColor: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                    ),
                    onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      _FilterChip(
                        label: 'Category',
                        value: _selectedCategory,
                        onChanged: (val) => setState(() => _selectedCategory = val),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Status',
                        value: _selectedStatus,
                        onChanged: (val) => setState(() => _selectedStatus = val),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: reportsAsync.when(
        data: (reports) {
          final filteredReports = reports.where((r) {
            return r.title.toLowerCase().contains(_searchQuery) ||
                   r.description.toLowerCase().contains(_searchQuery);
          }).toList();

          if (filteredReports.isEmpty) {
            return EmptyState(
              title: 'No Reports Found',
              message: 'Try adjusting your filters or search query.',
              topPadding: 170,
              onRetry: () => setState(() {
                _searchQuery = '';
                _selectedCategory = null;
                _selectedStatus = null;
              }),
            );
          }

          return AnimationLimiter(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 170, bottom: 24),
              itemCount: filteredReports.length,
              itemBuilder: (context, index) {
                final report = filteredReports[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    curve: Curves.easeOutQuart,
                    child: FadeInAnimation(
                      child: _ReportItem(report: report),
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const LoadingState(
          message: 'Syncing incidents...',
          topPadding: 170,
        ),
        error: (err, stackTrace) => ErrorState(
          message: err.toString(),
          topPadding: 170,
          onRetry: () => ref.refresh(reportsFeedControllerProvider(
            category: _selectedCategory,
            status: _selectedStatus,
          )),
        ),
      ),
    );

  }
}


class _ReportItem extends StatelessWidget {
  final IncidentReport report;
  const _ReportItem({required this.report});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.go('/reports/detail/${report.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatusBadge(status: report.status),
                      Text(
                        DateFormat.yMMMd().format(report.timestamp),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    report.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    report.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              report.category,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;
    String label = status.toUpperCase();

    switch (status) {
      case 'submitted':
        color = Colors.orange;
        icon = Icons.hourglass_top_rounded;
        break;
      case 'under_review':
        color = Colors.blue;
        icon = Icons.search_rounded;
        break;
      case 'resolved':
        color = Colors.green;
        icon = Icons.check_circle_rounded;
        break;
      default:
        color = Colors.grey;
        icon = Icons.info_outline_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String? value;
  final Function(String?) onChanged;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(value ?? label),
      selected: value != null,
      onSelected: (selected) {
        if (!selected) {
          onChanged(null);
        } else {
          onChanged(value == null ? 'Violence' : null);
        }
      },
    );
  }
}
