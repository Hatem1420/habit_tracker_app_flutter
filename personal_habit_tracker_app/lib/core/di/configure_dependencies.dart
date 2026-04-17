import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/features/habits/di/habits_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureHabits(getIt);
}
