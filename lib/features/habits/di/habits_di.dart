import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'habits_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHabits',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/habits'],
)
void configureHabits(GetIt getIt) {
  getIt.initHabits();
}
