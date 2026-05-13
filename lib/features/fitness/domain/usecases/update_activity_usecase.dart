import '../entities/fitness_activity_entity.dart';
import '../repositories/fitness_repository.dart';

class UpdateActivityUseCase {
  final FitnessRepository repository;

  UpdateActivityUseCase(this.repository);

  Future<void> call(FitnessActivityEntity activity) async {
    await repository.updateActivity(activity);
  }
}
