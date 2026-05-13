import '../entities/fitness_activity_entity.dart';
import '../repositories/fitness_repository.dart';

class GetActivitiesUseCase {
  final FitnessRepository repository;

  GetActivitiesUseCase(this.repository);

  Future<List<FitnessActivityEntity>> call() async {
    return repository.getActivities();
  }
}
