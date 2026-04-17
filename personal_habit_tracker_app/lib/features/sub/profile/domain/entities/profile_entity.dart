import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime dateOfBirth;

  const ProfileEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [id, name, email, dateOfBirth];
}
