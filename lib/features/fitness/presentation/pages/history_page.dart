import 'package:fitness_tracker_app/core/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fitness_provider.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("History")),

      body: activities.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text("No activities yet"));
          }

          return ListView.builder(
            itemCount: items.length,

            itemBuilder: (context, index) {
              final activity = items[index];

              return Dismissible(
                key: Key(activity.id),

                direction: DismissDirection.endToStart,

                confirmDismiss: (_) async {
                  return await DeleteDialog.show(context);
                },

                onDismissed: (_) async {
                  await ref
                      .read(deleteActivityUseCaseProvider)
                      .call(activity.id);

                  ref.invalidate(activitiesProvider);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Activity deleted")),
                    );
                  }
                },

                background: Container(),

                child: ListTile(
                  title: Text(activity.title),

                  subtitle: Text(
                    "${activity.calories} kcal • ${activity.duration} min",
                  ),
                ),
              );
            },
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}
