import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'profile_di.config.dart'; 

@InjectableInit(
  initializerName: 'initProfileSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/profile'],
)
void configureProfileSub(GetIt getIt) {
  getIt.initProfileSub();
}
