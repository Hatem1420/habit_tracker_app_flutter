import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'splash_di.config.dart'; 

@InjectableInit(
  initializerName: 'initSplash',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/splash'],
)
void configureSplash(GetIt getIt) {
  getIt.initSplash();
}
