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
import 'package:personal_habit_tracker_app/features/sub/profile/data/datasources/profile_remote_data_source.dart'
    as _i1061;
import 'package:personal_habit_tracker_app/features/sub/profile/data/repositories/profile_repository_data.dart'
    as _i679;
import 'package:personal_habit_tracker_app/features/sub/profile/domain/repositories/profile_repository_domain.dart'
    as _i615;
import 'package:personal_habit_tracker_app/features/sub/profile/domain/use_cases/profile_use_case.dart'
    as _i24;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfileSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1061.BaseProfileRemoteDataSource>(
      () => _i1061.ProfileRemoteDataSource(
        gh<_i141.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i615.ProfileRepositoryDomain>(
      () =>
          _i679.ProfileRepositoryData(gh<_i1061.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i24.ProfileUseCase>(
      () => _i24.ProfileUseCase(gh<_i615.ProfileRepositoryDomain>()),
    );
    return this;
  }
}
