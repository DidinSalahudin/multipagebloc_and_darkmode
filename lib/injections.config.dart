// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'common/config/cache_theme_service.dart' as _i5;
import 'common/moduls/modul.dart' as _i7;
import 'features/applications/app_theme/app_theme_bloc.dart' as _i6;
import 'features/applications/counter/counter_bloc.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.CounterBloc>(() => _i3.CounterBloc());
  await gh.factoryAsync<_i4.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i5.CacheThemeService>(
      () => _i5.CacheThemeServiceImpl(get<_i4.SharedPreferences>()));
  gh.factory<_i6.AppThemeBloc>(
      () => _i6.AppThemeBloc(get<_i5.CacheThemeService>()));
  return get;
}

class _$RegisterModule extends _i7.RegisterModule {}
