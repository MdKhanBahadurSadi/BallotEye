import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ballot_eye/core/utils/app_constants.dart';
import 'package:ballot_eye/core/providers/firebase_providers.dart';
import 'package:ballot_eye/features/reports/presentation/controllers/incident_reporting_controller.dart';
import 'package:ballot_eye/shared/widgets/app_button.dart';
import 'package:ballot_eye/shared/widgets/app_text_field.dart';
import 'package:go_router/go_router.dart';

class CreateReportScreen extends ConsumerStatefulWidget {
  const CreateReportScreen({super.key});

  @override
  ConsumerState<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends ConsumerState<CreateReportScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(incidentReportingControllerProvider);
    final controller = ref.read(incidentReportingControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Report'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Incident Details',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            AppTextField(
              label: 'Report Title',
              controller: _titleController,
              hintText: 'e.g., Ballot box tampering at XYZ station',
              prefixIcon: Icons.title_rounded,
              validator: (val) => val != null && val.isNotEmpty ? null : 'Enter a title',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                'Category',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
              ),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.category_outlined, size: 20),
                hintText: 'Select category',
              ),
              items: AppConstants.incidentCategories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedCategory = val),
            ),
            const SizedBox(height: 20),
            AppTextField(
              label: 'Detailed Description',
              controller: _descriptionController,
              hintText: 'Provide as much detail as possible...',
              prefixIcon: Icons.description_outlined,
            ),
            const SizedBox(height: 32),
            Text(
              'Evidence & Location',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickMedia(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt_outlined),
                    label: const Text('Take Photo'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _pickMedia(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('From Gallery'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (state.mediaFiles.isNotEmpty)
              _MediaPreviewGrid(
                files: state.mediaFiles,
                onRemove: (index) => controller.removeMedia(index),
              ),
            const SizedBox(height: 20),
            AppButton(
              color: state.latitude != null ? Colors.blueGrey.shade50 : null,
              textColor: state.latitude != null ? Colors.blueGrey : null,
              icon: state.latitude != null ? Icons.location_on : Icons.location_on_outlined,
              text: state.latitude != null 
                  ? 'Location: ${state.latitude!.toStringAsFixed(4)}, ${state.longitude!.toStringAsFixed(4)}' 
                  : 'Capture GPS Location',
              onPressed: () => controller.captureLocation(),
            ),
            if (state.error != null) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  state.error!, 
                  style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
            const SizedBox(height: 48),
            AppButton(
              text: 'Submit Official Report',
              isLoading: state.isSubmitting,
              onPressed: () async {
                if (_titleController.text.isEmpty || _selectedCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in title and category'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  return;
                }
                
                try {
                  await controller.submitReport(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                    category: _selectedCategory!,
                  );
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Report submitted successfully!'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                      ),
                    );
                    context.pop();
                  }
                } catch (e) {
                  // Error handled by state or snackbar
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );

  }

  Future<void> _pickMedia(ImageSource source) async {
    final mediaService = ref.read(mediaServiceProvider);
    final file = await mediaService.pickImage(source);
    if (file != null) {
      ref.read(incidentReportingControllerProvider.notifier).addMedia(file.file);
    }
  }
}

class _MediaPreviewGrid extends StatelessWidget {
  final List<File> files;
  final Function(int) onRemove;

  const _MediaPreviewGrid({required this.files, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: files.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) => Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(files[index], width: 100, height: 100, fit: BoxFit.cover),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: GestureDetector(
                onTap: () => onRemove(index),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
