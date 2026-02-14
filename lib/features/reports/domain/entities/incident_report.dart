class IncidentReport {
  final String id;
  final String observerId;
  final String title;
  final String description;
  final String category;
  final String status;
  final double latitude;
  final double longitude;
  final String? evidenceHash;
  final List<String> mediaUrls;
  final DateTime timestamp;
  final String? priority; // low, medium, high
  final String? internalNote;

  const IncidentReport({
    required this.id,
    required this.observerId,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.latitude,
    required this.longitude,
    this.evidenceHash,
    required this.mediaUrls,
    required this.timestamp,
    this.priority,
    this.internalNote,
  });
}
