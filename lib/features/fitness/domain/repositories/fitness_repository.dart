import '../entities/fitness_activity_entity.dart';

abstract class FitnessRepository {
  Future<void> addActivity(FitnessActivityEntity activity);

  Future<List<FitnessActivityEntity>> getActivities();
}
