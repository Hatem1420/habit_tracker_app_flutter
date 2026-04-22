// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:personal_habit_tracker_app/core/services/user_service.dart'
    as _i141;
import 'package:personal_habit_tracker_app/features/splash/data/datasources/splash_remote_data_source.dart'
    as _i736;
import 'package:personal_habit_tracker_app/features/splash/data/repositories/splash_repository_data.dart'
    as _i702;
import 'package:personal_habit_tracker_app/features/splash/domain/repositories/splash_repository_domain.dart'
    as _i635;
import 'package:personal_habit_tracker_app/features/splash/domain/use_cases/splash_use_case.dart'
    as _i887;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSplash({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i736.BaseSplashRemoteDataSource>(
      () => _i736.SplashRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i141.UserService>(),
      ),
    );
    gh.lazySingleton<_i635.SplashRepositoryDomain>(
      () => _i702.SplashRepositoryData(gh<_i736.BaseSplashRemoteDataSource>()),
    );
    gh.lazySingleton<_i887.SplashUseCase>(
      () => _i887.SplashUseCase(gh<_i635.SplashRepositoryDomain>()),
    );
    return this;
  }
}
