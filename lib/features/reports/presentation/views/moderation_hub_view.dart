import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ballot_eye/features/reports/domain/entities/incident_report.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/moderation_controller.dart';
import 'package:ballot_eye/shared/widgets/app_card.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:ballot_eye/shared/widgets/ui_state_widgets.dart';
import 'package:ballot_eye/shared/widgets/glass_container.dart';

class ModerationHubView extends ConsumerWidget {
  const ModerationHubView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: GlassContainer(
            borderRadius: 0,
            opacity: 0.1,
            blur: 15,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Moderation Hub'),
              bottom: const TabBar(
                isScrollable: true,
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                tabs: [
                  Tab(text: 'Submitted'),
                  Tab(text: 'Under Review'),
                  Tab(text: 'Resolved'),
                  Tab(text: 'Closed'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _ReportList(status: 'submitted'),
            _ReportList(status: 'under_review'),
            _ReportList(status: 'resolved'),
            _ReportList(status: 'closed'),
          ],
        ),
      ),
    );
  }
}

class _ReportList extends ConsumerStatefulWidget {
  final String status;
  const _ReportList({required this.status});

  @override
  ConsumerState<_ReportList> createState() => _ReportListState();
}

class _ReportListState extends ConsumerState<_ReportList> {
  final _scrollController = ScrollController();

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
      ref.read(moderationControllerProvider(status: widget.status).notifier).fetchNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final reportsAsync = ref.watch(moderationControllerProvider(status: widget.status));

    return reportsAsync.when(
      data: (reports) {
        if (reports.isEmpty) {
          return const EmptyState(
            title: 'No Reports',
            message: 'No reports in this status found.',
            topPadding: 130,
          );
        }
        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 130, bottom: 24),
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return _ModerationItem(report: report);
          },
        );
      },
      loading: () => const LoadingState(
        message: 'Syncing moderation hub...',
        topPadding: 130,
      ),
      error: (err, stackTrace) => ErrorState(
        message: err.toString(),
        topPadding: 130,
        onRetry: () => ref.refresh(moderationControllerProvider(status: widget.status)),
      ),
    );


  }
}

class _ModerationItem extends ConsumerWidget {
  final IncidentReport report;
  const _ModerationItem({required this.report});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      if (report.priority != null) 
                        _PriorityBadge(priority: report.priority!),
                      Text(
                        DateFormat.yMMMd().format(report.timestamp),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade500,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    report.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    report.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        report.category,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(Icons.edit_note),
                        onPressed: () => _showActionDialog(context, ref),
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

  void _showActionDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _ModerationActionDialog(report: report),
    );
  }
}

class _PriorityBadge extends StatelessWidget {
  final String priority;
  const _PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    if (priority == 'high') color = Colors.red;
    if (priority == 'medium') color = Colors.orange;
    if (priority == 'low') color = Colors.green;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color),
      ),
      child: Text(
        priority.toUpperCase(),
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ModerationActionDialog extends ConsumerStatefulWidget {
  final IncidentReport report;
  const _ModerationActionDialog({required this.report});

  @override
  ConsumerState<_ModerationActionDialog> createState() => _ModerationActionDialogState();
}

class _ModerationActionDialogState extends ConsumerState<_ModerationActionDialog> {
  late String _status;
  String? _priority;
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _status = widget.report.status;
    _priority = widget.report.priority;
    _noteController.text = widget.report.internalNote ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Update Incident'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              isExpanded: true,
              value: _status,
              items: ['submitted', 'under_review', 'resolved', 'closed'].map((s) {
                return DropdownMenuItem(value: s, child: Text(s.replaceAll('_', ' ').toUpperCase()));
              }).toList(),
              onChanged: (val) => setState(() => _status = val!),
            ),
            const SizedBox(height: 16),
            const Text('Priority', style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String?>(
              isExpanded: true,
              value: _priority,
              hint: const Text('Select Priority'),
              items: ['low', 'medium', 'high'].map((p) {
                return DropdownMenuItem(value: p, child: Text(p.toUpperCase()));
              }).toList(),
              onChanged: (val) => setState(() => _priority = val),
            ),
            const SizedBox(height: 16),
            const Text('Internal Note', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(hintText: 'Add a note for other moderators...'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('CANCEL')),
        ElevatedButton(
          onPressed: () async {
            await ref.read(moderationControllerProvider(status: widget.report.status).notifier).updateStatus(
              reportId: widget.report.id,
              newStatus: _status,
              priority: _priority,
              note: _noteController.text,
            );
            if (mounted) Navigator.pop(context);
          },
          child: const Text('UPDATE'),
        ),
      ],
    );
  }
}
