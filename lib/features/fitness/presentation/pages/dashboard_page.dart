import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/widgets/section_title.dart';
import '../widgets/fitness_stat_card.dart';
import '../widgets/progress_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: AppSizes.md,
                mainAxisSpacing: AppSizes.md,

                children: const [
                  FitnessStatCard(
                    title: 'Steps',
                    value: '5,240',
                    icon: Icons.directions_walk,
                  ),

                  FitnessStatCard(
                    title: 'Calories',
                    value: '840',
                    icon: Icons.local_fire_department,
                  ),

                  FitnessStatCard(
                    title: 'Workout',
                    value: '45 min',
                    icon: Icons.fitness_center,
                  ),

                  FitnessStatCard(
                    title: 'Water',
                    value: '2.5 L',
                    icon: Icons.water_drop,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        child: const Icon(Icons.add),
      ),
    );
  }
}
