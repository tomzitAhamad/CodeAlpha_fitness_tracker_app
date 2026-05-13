import 'package:fitness_tracker_app/features/fitness/presentation/pages/add_activity_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fitness_provider.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/section_title.dart';
import '../widgets/fitness_stat_card.dart';
import '../widgets/progress_header.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(activitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Fitness Tracker')),

      body: Padding(
        padding: const EdgeInsets.all(AppSizes.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const ProgressHeader(
              title: "Today's Progress",
              subtitle: 'Keep Moving 🔥',
            ),

            const SizedBox(height: AppSizes.lg),

            const SectionTitle(title: 'Daily Activity'),

            const SizedBox(height: AppSizes.md),

            Expanded(
              child: activitiesAsync.when(
                data: (activities) {
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: AppSizes.md,
                    mainAxisSpacing: AppSizes.md,

                    children: [
                      FitnessStatCard(
                        title: 'Activities',
                        value: activities.length.toString(),
                        icon: Icons.fitness_center,
                      ),

                      FitnessStatCard(
                        title: 'Calories',
                        value: activities
                            .fold<int>(0, (sum, item) => sum + item.calories)
                            .toString(),
                        icon: Icons.local_fire_department,
                      ),

                      FitnessStatCard(
                        title: 'Duration',
                        value:
                            '${activities.fold<int>(0, (sum, item) => sum + item.duration)} min',
                        icon: Icons.timer,
                      ),

                      const FitnessStatCard(
                        title: 'Water',
                        value: '2.5 L',
                        icon: Icons.water_drop,
                      ),
                    ],
                  );
                },

                error: (e, _) => Center(child: Text(e.toString())),

                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddActivityPage()),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
