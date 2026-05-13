import 'package:fitness_tracker_app/features/fitness/domain/usecases/delete_activity_usecase.dart';
import 'package:fitness_tracker_app/features/fitness/domain/usecases/update_activity_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/fitness_local_datasource.dart';
import '../../data/repositories/fitness_repository_impl.dart';
import '../../domain/entities/fitness_activity_entity.dart';
import '../../domain/usecases/add_activity_usecase.dart';
import '../../domain/usecases/get_activities_usecase.dart';

final localDataSourceProvider = Provider<FitnessLocalDataSource>(
  (ref) => FitnessLocalDataSource(),
);

final repositoryProvider = Provider<FitnessRepositoryImpl>(
  (ref) => FitnessRepositoryImpl(ref.read(localDataSourceProvider)),
);

final addActivityUseCaseProvider = Provider<AddActivityUseCase>(
  (ref) => AddActivityUseCase(ref.read(repositoryProvider)),
);

final getActivitiesUseCaseProvider = Provider<GetActivitiesUseCase>(
  (ref) => GetActivitiesUseCase(ref.read(repositoryProvider)),
);

final activitiesProvider = FutureProvider<List<FitnessActivityEntity>>((
  ref,
) async {
  return ref.read(getActivitiesUseCaseProvider).call();
});
final deleteActivityUseCaseProvider = Provider(
  (ref) => DeleteActivityUseCase(ref.read(repositoryProvider)),
);

final updateActivityUseCaseProvider = Provider(
  (ref) => UpdateActivityUseCase(ref.read(repositoryProvider)),
);
