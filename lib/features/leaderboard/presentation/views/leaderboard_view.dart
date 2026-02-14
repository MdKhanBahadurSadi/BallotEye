import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/features/leaderboard/presentation/controllers/leaderboard_controller.dart';
import 'package:ballot_eye/features/leaderboard/domain/entities/election_area.dart';
import 'package:ballot_eye/shared/widgets/app_card.dart';
import 'package:ballot_eye/shared/widgets/ui_state_widgets.dart';
import 'package:ballot_eye/core/utils/app_constants.dart';

class LeaderboardView extends ConsumerWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardAsync = ref.watch(leaderboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.leaderboardTitle),
      ),
      body: leaderboardAsync.when(
        data: (areas) {
          if (areas.isEmpty) {
            return const EmptyState(
              title: 'No Performance Data',
              message: 'Check back later once incidents are reported and resolved.',
              icon: Icons.leaderboard_outlined,
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: areas.length,
            itemBuilder: (context, index) {
              final area = areas[index];
              return _LeaderboardItem(area: area, rank: index + 1);
            },
          );
        },
        loading: () => const LoadingState(message: 'Fetching area rankings...'),
        error: (err, _) => ErrorState(
          message: err.toString(),
          onRetry: () => ref.refresh(leaderboardControllerProvider),
        ),
      ),
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final ElectionArea area;
  final int rank;

  const _LeaderboardItem({required this.area, required this.rank});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getRankColor(rank),
          child: Text(
            '#$rank',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(area.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Code: ${area.code}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              area.stats.score.toStringAsFixed(1),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Text('Performance Score', style: TextStyle(fontSize: 10)),
          ],
        ),
        onTap: () => _showAreaStats(context, area),
      ),
    );
  }

  Color _getRankColor(int rank) {
    if (rank == 1) return Colors.amber;
    if (rank == 2) return Colors.grey;
    if (rank == 3) return Colors.brown;
    return Colors.blueGrey;
  }

  void _showAreaStats(BuildContext context, ElectionArea area) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AreaStatsDetail(area: area),
    );
  }
}

class _AreaStatsDetail extends StatelessWidget {
  final ElectionArea area;
  const _AreaStatsDetail({required this.area});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 24),
            Text(area.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('District Code: ${area.code}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            const Text('Performance Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _StatRow(label: 'Total Incidents Reported', value: '${area.stats.submittedCount}', icon: Icons.report),
            _StatRow(label: 'Incidents Resolved', value: '${area.stats.resolvedCount}', icon: Icons.check_circle, color: Colors.green),
            _StatRow(label: 'Avg. Resolution Time', value: '${area.stats.avgResolveHours.toStringAsFixed(1)} hours', icon: Icons.timer),
            const Divider(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  const Text('Overall Area Score', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    area.stats.score.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Calculated based on resolution rate and speed of governance actions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
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

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const _StatRow({required this.label, required this.value, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, color: color ?? Colors.blue, size: 20),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 15)),
          const Spacer(),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
