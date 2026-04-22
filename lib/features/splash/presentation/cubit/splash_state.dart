import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashInitialState extends SplashState {}
class SplashSuccessState extends SplashState {}

class SplashErrorState extends SplashState {
  final String message;
  const SplashErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

