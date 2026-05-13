import 'package:hive_flutter/hive_flutter.dart';

import '../../features/fitness/data/models/fitness_activity_model.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(FitnessActivityModelAdapter());
  }
}
