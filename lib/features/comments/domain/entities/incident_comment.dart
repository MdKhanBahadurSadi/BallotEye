class IncidentComment {
  final String id;
  final String userId;
  final String userName;
  final String text;
  final DateTime timestamp;
  final String? sentiment; // positive, neutral, negative

  const IncidentComment({
    required this.id,
    required this.userId,
    required this.userName,
    required this.text,
    required this.timestamp,
    this.sentiment,
  });
}
