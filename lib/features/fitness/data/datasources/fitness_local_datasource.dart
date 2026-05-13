import 'package:hive/hive.dart';

import '../models/fitness_activity_model.dart';

class FitnessLocalDataSource {
  static const String boxName = 'fitness_box';

  Future<void> addActivity(FitnessActivityModel activity) async {
    final box = await Hive.openBox<FitnessActivityModel>(boxName);

    await box.put(activity.id, activity);
  }

  Future<List<FitnessActivityModel>> getActivities() async {
    final box = await Hive.openBox<FitnessActivityModel>(boxName);

    return box.values.toList();
  }
}
