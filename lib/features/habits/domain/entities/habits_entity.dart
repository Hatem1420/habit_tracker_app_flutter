import 'package:equatable/equatable.dart';

class HabitsEntity extends Equatable {
  final String id;
  final String title;
  final String createdAt;
  final String? habitColor;

  const HabitsEntity({
    required this.id,
    required this.title,
    required this.createdAt,
    this.habitColor,
  });

  @override
  List<Object?> get props => [title, id, createdAt, habitColor];
}
