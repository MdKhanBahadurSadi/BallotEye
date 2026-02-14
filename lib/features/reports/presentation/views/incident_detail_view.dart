import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/report_detail_controller.dart';
import 'package:ballot_eye/features/audit/domain/entities/incident_activity.dart';
import 'package:ballot_eye/shared/widgets/app_card.dart';
import 'package:ballot_eye/features/comments/domain/entities/incident_comment.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/comments_controller.dart';
import 'package:intl/intl.dart';
import 'package:ballot_eye/shared/widgets/ui_state_widgets.dart';

class IncidentDetailView extends ConsumerWidget {
  final String reportId;
  const IncidentDetailView({super.key, required this.reportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportDetailProvider(reportId));
    final activityAsync = ref.watch(reportActivityProvider(reportId));

    return Scaffold(
      appBar: AppBar(title: const Text('Incident Details')),
      body: reportAsync.when(
        data: (report) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderSection(report: report),
              const SizedBox(height: 24),
              _DescriptionSection(description: report.description),
              const SizedBox(height: 24),
              if (report.mediaUrls.isNotEmpty) ...[
                const Text('Media Evidence', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _MediaGallery(urls: report.mediaUrls),
                const SizedBox(height: 24),
              ],
              _LocationSection(lat: report.latitude, lng: report.longitude),
              const SizedBox(height: 24),
              const Text('Activity Timeline', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              activityAsync.when(
                data: (activities) => _ActivityTimeline(activities: activities),
                loading: () => const Center(child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(),
                )),
                error: (e, _) => Text('Error loading activity: $e'),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 24),
              _CommentsSection(reportId: reportId),
              const SizedBox(height: 40),
            ],
          ),
        ),
        loading: () => const LoadingState(message: 'Loading report details...'),
        error: (err, _) => ErrorState(
          message: err.toString(),
          onRetry: () => ref.refresh(reportDetailProvider(reportId)),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final IncidentReport report;
  const _HeaderSection({required this.report});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                report.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _StatusChip(status: report.status),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Reported on ${DateFormat.yMMMMd().add_jm().format(report.timestamp)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        Chip(label: Text(report.category)),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.toUpperCase(),
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  final String description;
  const _DescriptionSection({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(description, style: const TextStyle(fontSize: 16, height: 1.5)),
      ],
    );
  }
}

class _MediaGallery extends StatelessWidget {
  final List<String> urls;
  const _MediaGallery({required this.urls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: urls.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            urls[index],
            width: 300,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: 300,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LocationSection extends StatelessWidget {
  final double lat;
  final double lng;
  const _LocationSection({required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        AppCard(
          child: ListTile(
            leading: const Icon(Icons.location_on, color: Colors.red),
            title: Text('${lat.toStringAsFixed(6)}, ${lng.toStringAsFixed(6)}'),
            subtitle: const Text('Coordinates verified via GPS'),
          ),
        ),
      ],
    );
  }
}

class _ActivityTimeline extends StatelessWidget {
  final List<IncidentActivity> activities;
  const _ActivityTimeline({required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: activities.map((activity) => _ActivityItem(activity: activity)).toList(),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IncidentActivity activity;
  const _ActivityItem({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 12, color: Colors.blue),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.note, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(
                  '${activity.userName} • ${DateFormat.yMMMd().add_jm().format(activity.timestamp)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentsSection extends ConsumerWidget {
  final String reportId;
  const _CommentsSection({required this.reportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsAsync = ref.watch(reportCommentsProvider(reportId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Community Comments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            commentsAsync.when(
              data: (comments) => Text('${comments.length}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _CommentInput(reportId: reportId),
        const SizedBox(height: 24),
        commentsAsync.when(
          data: (comments) {
            if (comments.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('No comments yet. Be the first to share your thoughts!', textAlign: TextAlign.center),
                ),
              );
            }
            return Column(
              children: comments.map((c) => _CommentItem(comment: c)).toList(),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text('Error loading comments: $e'),
        ),
      ],
    );
  }
}

class _CommentItem extends StatelessWidget {
  final IncidentComment comment;
  const _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Text(comment.userName.substring(0, 1).toUpperCase(), style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(comment.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat.yMMMd().format(comment.timestamp),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (comment.sentiment != null) ...[
                      const Spacer(),
                      _SentimentBadge(sentiment: comment.sentiment!),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(comment.text, style: const TextStyle(fontSize: 15, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SentimentBadge extends StatelessWidget {
  final String sentiment;
  const _SentimentBadge({required this.sentiment});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    switch (sentiment) {
      case 'positive':
        icon = Icons.sentiment_very_satisfied;
        color = Colors.green;
        break;
      case 'negative':
        icon = Icons.sentiment_very_dissatisfied;
        color = Colors.red;
        break;
      default:
        icon = Icons.sentiment_neutral;
        color = Colors.orange;
    }
    return Icon(icon, size: 16, color: color);
  }
}

class _CommentInput extends ConsumerStatefulWidget {
  final String reportId;
  const _CommentInput({required this.reportId});

  @override
  ConsumerState<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<_CommentInput> {
  final _controller = TextEditingController();
  String? _selectedSentiment;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() => _isSubmitting = true);
    try {
      await ref.read(commentsControllerProvider.notifier).addComment(
            reportId: widget.reportId,
            text: _controller.text.trim(),
            sentiment: _selectedSentiment,
          );
      _controller.clear();
      setState(() => _selectedSentiment = null);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Add a comment...',
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('Sentiment:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            _SentimentSelector(
              onSelected: (val) => setState(() => _selectedSentiment = val),
              selected: _selectedSentiment,
            ),
            const Spacer(),
            if (_isSubmitting)
              const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
            else
              TextButton(
                onPressed: _submit,
                child: const Text('POST'),
              ),
          ],
        ),
      ],
    );
  }
}

class _SentimentSelector extends StatelessWidget {
  final Function(String?) onSelected;
  final String? selected;
  const _SentimentSelector({required this.onSelected, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SentimentIcon(icon: Icons.sentiment_very_satisfied, value: 'positive', selected: selected, onSelected: onSelected),
        _SentimentIcon(icon: Icons.sentiment_neutral, value: 'neutral', selected: selected, onSelected: onSelected),
        _SentimentIcon(icon: Icons.sentiment_very_dissatisfied, value: 'negative', selected: selected, onSelected: onSelected),
      ],
    );
  }
}

class _SentimentIcon extends StatelessWidget {
  final IconData icon;
  final String value;
  final String? selected;
  final Function(String?) onSelected;

  const _SentimentIcon({required this.icon, required this.value, required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;
    return IconButton(
      icon: Icon(icon),
      color: isSelected ? _getColor() : Colors.grey,
      onPressed: () => onSelected(isSelected ? null : value),
      visualDensity: VisualDensity.compact,
    );
  }

  Color _getColor() {
    if (value == 'positive') return Colors.green;
    if (value == 'negative') return Colors.red;
    return Colors.orange;
  }
}
