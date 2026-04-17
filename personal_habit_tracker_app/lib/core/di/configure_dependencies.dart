import 'package:get_it/get_it.dart';
import 'package:personal_habit_tracker_app/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:personal_habit_tracker_app/features/auth/di/auth_di.dart';
import 'package:personal_habit_tracker_app/features/splash/di/splash_di.dart';
import 'package:personal_habit_tracker_app/features/sub/profile/di/profile_di.dart';
import 'package:personal_habit_tracker_app/features/sub/sign_out/di/sign_out_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureAuth(getIt);
    configureSplash(getIt);
    configureProfileSub(getIt);
    configureSignOutSub(getIt);
}
