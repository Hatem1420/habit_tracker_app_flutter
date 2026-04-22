import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/cubit/habits_cubit.dart';
import 'package:personal_habit_tracker_app/features/habits/presentation/pages/habits_feature_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:personal_habit_tracker_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:personal_habit_tracker_app/features/splash/presentation/pages/splash_feature_screen.dart';
import 'package:personal_habit_tracker_app/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/pages/habit_logs_feature_screen.dart';
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (context) => SplashCubit(GetIt.I.get()),
          child: const SplashFeatureScreen(),
        ),
      ),

      GoRoute(
  path: Routes.habitLogs,
  builder: (context, state) => BlocProvider(
    create: (context) => HabitLogsCubit(GetIt.I.get())..getHabitLogsMethod(),
    child: HabitLogsFeatureScreen(
      habitId: state.extra as String,
    ),
  ),
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
