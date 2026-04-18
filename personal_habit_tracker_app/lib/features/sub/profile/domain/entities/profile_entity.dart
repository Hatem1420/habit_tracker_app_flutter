import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime dateOfBirth;
  final int totalHabits;
  final int noOfCompletes;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.totalHabits,
    required this.noOfCompletes,
  });

  @override
  List<Object?> get props => [id, name, email, dateOfBirth];
}
