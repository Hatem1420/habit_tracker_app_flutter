import 'package:equatable/equatable.dart';

class HabitsEntity extends Equatable {
  final String id;
  final String title;
  final String createdAt;

  const HabitsEntity({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [title, id, createdAt];
}
