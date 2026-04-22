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
import 'package:personal_habit_tracker_app/features/habit_logs/data/datasources/habit_logs_remote_data_source.dart'
    as _i809;
import 'package:personal_habit_tracker_app/features/habit_logs/data/repositories/habit_logs_repository_data.dart'
    as _i980;
import 'package:personal_habit_tracker_app/features/habit_logs/domain/repositories/habit_logs_repository_domain.dart'
    as _i433;
import 'package:personal_habit_tracker_app/features/habit_logs/domain/use_cases/habit_logs_use_case.dart'
    as _i224;
import 'package:personal_habit_tracker_app/features/habit_logs/presentation/cubit/habit_logs_cubit.dart'
    as _i177;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHabitLogs({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i809.BaseHabitLogsRemoteDataSource>(
      () => _i809.HabitLogsRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i141.UserService>(),
      ),
    );
    gh.lazySingleton<_i433.HabitLogsRepositoryDomain>(
      () => _i980.HabitLogsRepositoryData(
        gh<_i809.BaseHabitLogsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i224.HabitLogsUseCase>(
      () => _i224.HabitLogsUseCase(gh<_i433.HabitLogsRepositoryDomain>()),
    );
    gh.factory<_i177.HabitLogsCubit>(
      () => _i177.HabitLogsCubit(gh<_i224.HabitLogsUseCase>()),
    );
    return this;
  }
}
