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
import 'package:personal_habit_tracker_app/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i203;
import 'package:personal_habit_tracker_app/features/auth/data/repositories/auth_repository_data.dart'
    as _i125;
import 'package:personal_habit_tracker_app/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i326;
import 'package:personal_habit_tracker_app/features/auth/domain/use_cases/auth_use_case.dart'
    as _i859;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i203.BaseAuthRemoteDataSource>(
      () => _i203.AuthRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i141.UserService>(),
      ),
    );
    gh.lazySingleton<_i326.AuthRepositoryDomain>(
      () => _i125.AuthRepositoryData(gh<_i203.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i859.AuthUseCase>(
      () => _i859.AuthUseCase(gh<_i326.AuthRepositoryDomain>()),
    );
    return this;
  }
}
