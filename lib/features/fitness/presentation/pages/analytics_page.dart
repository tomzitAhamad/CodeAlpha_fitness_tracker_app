import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fitness_provider.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Analytics")),

      body: activities.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text("No analytics yet"));
          }

          return Padding(
            padding: const EdgeInsets.all(20),

            child: BarChart(
              BarChartData(
                barGroups: List.generate(items.length, (index) {
                  final activity = items[index];

                  return BarChartGroupData(
                    x: index,

                    barRods: [
                      BarChartRodData(toY: activity.calories.toDouble()),
                    ],
                  );
                }),
              ),
            ),
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
