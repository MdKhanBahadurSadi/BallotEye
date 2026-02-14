class AreaStats {
  final int submittedCount;
  final int resolvedCount;
  final double avgResolveHours;
  final double score;

  const AreaStats({
    required this.submittedCount,
    required this.resolvedCount,
    required this.avgResolveHours,
    required this.score,
  });

  const AreaStats.empty()
      : submittedCount = 0,
        resolvedCount = 0,
        avgResolveHours = 0.0,
        score = 0.0;
}
