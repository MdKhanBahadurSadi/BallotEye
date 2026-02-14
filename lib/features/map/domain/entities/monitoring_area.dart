class MonitoringArea {
  final String id;
  final String name;
  final String type; // e.g., 'constituency', 'polling_station'
  final Map<String, dynamic> geoJson;

  const MonitoringArea({
    required this.id,
    required this.name,
    required this.type,
    required this.geoJson,
  });
}
