import '../entities/fitness_activity_entity.dart';
import '../repositories/fitness_repository.dart';

class AddActivityUseCase {
  final FitnessRepository repository;

  AddActivityUseCase(this.repository);

  Future<void> call(FitnessActivityEntity activity) async {
    await repository.addActivity(activity);
  }
}
