import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:example_multibloc/common/config/cache_theme_service.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_theme_event.dart';
part 'app_theme_state.dart';
part 'app_theme_bloc.freezed.dart';

@injectable
class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  final CacheThemeService cacheThemeService;

  AppThemeBloc(this.cacheThemeService)
      : super(
          _AppTheme(
            cacheThemeService.getCacheTheme(),
          ),
        );

  @override
  Stream<AppThemeState> mapEventToState(
    AppThemeEvent event,
  ) async* {
    yield* event.map(
      starterTheme: (e) async* {
        final isDarkModeEnable = cacheThemeService.getCacheTheme();
        if (isDarkModeEnable == true) {
          // yield AppThemeState.appTheme(false);
          yield AppThemeState.appThemeOption(
            themeData: ThemeMode.light,
          );
        } else {
          // yield AppThemeState.appTheme(isDarkModeEnable);
          if (isDarkModeEnable) {
            yield AppThemeState.appThemeOption(
              themeData: ThemeMode.dark,
            );
          } else {
            yield AppThemeState.appThemeOption(
              themeData: ThemeMode.light,
            );
          }
        }
      },
      updateTheme: (e) async* {
        cacheThemeService.updateCacheTheme(e.value);
        ThemeMode _themeMode;
        if (e.value) {
          _themeMode = ThemeMode.dark;
        } else {
          _themeMode = ThemeMode.light;
        }

        yield AppThemeState.appThemeOption(
          themeData: _themeMode,
        );
      },
    );
  }
}
