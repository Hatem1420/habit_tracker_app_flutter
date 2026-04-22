import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_habit_tracker_app/core/navigation/routers.dart';
import 'package:personal_habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:personal_habit_tracker_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:personal_habit_tracker_app/features/splash/presentation/cubit/splash_state.dart';

class SplashFeatureScreen extends StatelessWidget {
  const SplashFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          switch (state) {
            case SplashSuccessState _:
              context.go(Routes.habits);
            case SplashErrorState _:
              context.go(Routes.auth);
          }
        },
        child: Center(child: LoadingWidget()),
      ),
    );
  }
}
