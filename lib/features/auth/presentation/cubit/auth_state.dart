import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final bool signIn;
  const AuthState({this.signIn = true});

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState({super.signIn});

  @override
  List<Object?> get props => [signIn];
}

class AuthSuccessState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
