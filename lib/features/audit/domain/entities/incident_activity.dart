class IncidentActivity {
  final String id;
  final String userId;
  final String userName;
  final String type; // e.g., 'status_change', 'comment_added'
  final String note;
  final DateTime timestamp;

  const IncidentActivity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.type,
    required this.note,
    required this.timestamp,
  });
}
