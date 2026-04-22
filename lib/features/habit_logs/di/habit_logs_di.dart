import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'habit_logs_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHabitLogs',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/habit_logs'],
)
void configureHabitLogs(GetIt getIt) {
  getIt.initHabitLogs();
}
