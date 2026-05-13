import '../../domain/entities/fitness_activity_entity.dart';
import '../../domain/repositories/fitness_repository.dart';
import '../datasources/fitness_local_datasource.dart';
import '../models/fitness_activity_model.dart';

class FitnessRepositoryImpl implements FitnessRepository {
  final FitnessLocalDataSource localDataSource;

  FitnessRepositoryImpl(this.localDataSource);

  @override
  Future<void> addActivity(FitnessActivityEntity activity) async {
    final model = FitnessActivityModel.fromEntity(activity);

    await localDataSource.addActivity(model);
  }

  @override
  Future<List<FitnessActivityEntity>> getActivities() async {
    final models = await localDataSource.getActivities();

    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> deleteActivity(String id) async {
    await localDataSource.deleteActivity(id);
  }

  @override
  Future<void> updateActivity(FitnessActivityEntity activity) async {
    final model = FitnessActivityModel.fromEntity(activity);

    await localDataSource.updateActivity(model);
  }
}
