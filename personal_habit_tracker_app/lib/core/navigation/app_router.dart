import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/pages/habits_feature_screen.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.habits,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),
    
  GoRoute(
    path: Routes.habits,
    builder: (context, state) => BlocProvider(
          create: (context) => HabitsCubit(GetIt.I.get())..getHabitsMethod(),
          child: const HabitsFeatureScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
