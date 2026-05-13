import 'package:hive/hive.dart';

import '../../domain/entities/fitness_activity_entity.dart';

part 'fitness_activity_model.g.dart';

@HiveType(typeId: 0)
class FitnessActivityModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int calories;

  @HiveField(3)
  final int duration;

  @HiveField(4)
  final DateTime date;

  FitnessActivityModel({
    required this.id,
    required this.title,
    required this.calories,
    required this.duration,
    required this.date,
  });

  factory FitnessActivityModel.fromEntity(FitnessActivityEntity entity) {
    return FitnessActivityModel(
      id: entity.id,
      title: entity.title,
      calories: entity.calories,
      duration: entity.duration,
      date: entity.date,
    );
  }

  FitnessActivityEntity toEntity() {
    return FitnessActivityEntity(
      id: id,
      title: title,
      calories: calories,
      duration: duration,
      date: date,
    );
  }
}
