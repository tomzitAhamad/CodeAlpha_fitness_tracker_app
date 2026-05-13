import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/fitness_activity_entity.dart';
import '../providers/fitness_provider.dart';

class AddActivityPage extends ConsumerStatefulWidget {
  const AddActivityPage({super.key});

  @override
  ConsumerState<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends ConsumerState<AddActivityPage> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final caloriesController = TextEditingController();
  final durationController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    caloriesController.dispose();
    durationController.dispose();
    super.dispose();
  }

  Future<void> saveActivity() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final activity = FitnessActivityEntity(
      id: const Uuid().v4(),
      title: titleController.text.trim(),
      calories: int.parse(caloriesController.text.trim()),
      duration: int.parse(durationController.text.trim()),
      date: DateTime.now(),
    );

    await ref.read(addActivityUseCaseProvider).call(activity);

    ref.invalidate(activitiesProvider);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  InputDecoration customInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,

      prefixIcon: Icon(icon),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Activity')),

      body: Padding(
        padding: const EdgeInsets.all(AppSizes.md),

        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: titleController,

                decoration: customInputDecoration(
                  'Workout Title',
                  Icons.fitness_center,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter title';
                  }

                  return null;
                },
              ),

              const SizedBox(height: AppSizes.md),

              TextFormField(
                controller: caloriesController,

                keyboardType: TextInputType.number,

                decoration: customInputDecoration(
                  'Calories Burned',
                  Icons.local_fire_department,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter calories';
                  }

                  return null;
                },
              ),

              const SizedBox(height: AppSizes.md),

              TextFormField(
                controller: durationController,

                keyboardType: TextInputType.number,

                decoration: customInputDecoration(
                  'Duration (minutes)',
                  Icons.timer,
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter duration';
                  }

                  return null;
                },
              ),

              const SizedBox(height: AppSizes.xl),

              CustomButton(
                text: 'Save Activity',
                icon: Icons.save,

                onPressed: saveActivity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
