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
import 'package:personal_habit_tracker_app/features/sub/sign_out/data/datasources/sign_out_remote_data_source.dart'
    as _i398;
import 'package:personal_habit_tracker_app/features/sub/sign_out/data/repositories/sign_out_repository_data.dart'
    as _i837;
import 'package:personal_habit_tracker_app/features/sub/sign_out/domain/repositories/sign_out_repository_domain.dart'
    as _i704;
import 'package:personal_habit_tracker_app/features/sub/sign_out/domain/use_cases/sign_out_use_case.dart'
    as _i71;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSignOutSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i398.BaseSignOutRemoteDataSource>(
      () => _i398.SignOutRemoteDataSource(gh<_i141.UserService>()),
    );
    gh.lazySingleton<_i704.SignOutRepositoryDomain>(
      () =>
          _i837.SignOutRepositoryData(gh<_i398.BaseSignOutRemoteDataSource>()),
    );
    gh.lazySingleton<_i71.SignOutUseCase>(
      () => _i71.SignOutUseCase(gh<_i704.SignOutRepositoryDomain>()),
    );
    return this;
  }
}
