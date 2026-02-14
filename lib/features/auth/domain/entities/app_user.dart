class AppUser {
  final String id;
  final String email;
  final String name;
  final String role;
  final List<String>? areaIds;
  final DateTime createdAt;

  const AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    this.areaIds,
    required this.createdAt,
  });

  bool get isAdmin => role == 'admin';
  bool get isModerator => role == 'moderator';
  bool get isObserver => role == 'observer';
}
