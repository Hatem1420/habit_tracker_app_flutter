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
import 'package:personal_habit_tracker_app/features/habits/data/datasources/habits_remote_data_source.dart'
    as _i424;
import 'package:personal_habit_tracker_app/features/habits/data/repositories/habits_repository_data.dart'
    as _i834;
import 'package:personal_habit_tracker_app/features/habits/domain/repositories/habits_repository_domain.dart'
    as _i706;
import 'package:personal_habit_tracker_app/features/habits/domain/use_cases/habits_use_case.dart'
    as _i999;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHabits({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i424.BaseHabitsRemoteDataSource>(
      () => _i424.HabitsRemoteDataSource(
        gh<_i141.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i706.HabitsRepositoryDomain>(
      () => _i834.HabitsRepositoryData(gh<_i424.BaseHabitsRemoteDataSource>()),
    );
    gh.lazySingleton<_i999.HabitsUseCase>(
      () => _i999.HabitsUseCase(gh<_i706.HabitsRepositoryDomain>()),
    );
    return this;
  }
}
