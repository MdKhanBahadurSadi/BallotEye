class AppConstants {
  static const String appName = 'BallotEye';
  
  // Incident Categories
  static const List<String> incidentCategories = [
    'Violence',
    'Voter Intimidation',
    'Ballot Stuffing',
    'Vote Buying',
    'Incorrect Count',
    'Polling Place Disturbance',
    'Other',
  ];

  // Incident Statuses
  static const String statusSubmitted = 'submitted';
  static const String statusUnderReview = 'under_review';
  static const String statusResolved = 'resolved';
  static const String statusClosed = 'closed';
}
