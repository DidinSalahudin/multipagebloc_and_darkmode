import 'package:example_multibloc/features/applications/app_theme/app_theme_bloc.dart';
import 'package:example_multibloc/features/applications/counter/counter_bloc.dart';
import 'package:example_multibloc/features/presentations/router/router_generator.dart';
import 'package:example_multibloc/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeMode? _themeData;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => getIt<CounterBloc>(),
        ),
        BlocProvider<AppThemeBloc>(
          create: (context) =>
              getIt<AppThemeBloc>()..add(AppThemeEvent.starterTheme()),
        ),
      ],
      child: BlocListener<AppThemeBloc, AppThemeState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            appThemeOption: (e) {
              _themeData = e.themeData;
            },
          );
        },
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (contextBAppTheme, stateBAppTheme) {
            return MaterialApp(
              title: 'Example Mutlipage Bloc',
              initialRoute: RouteGenerator.routeHome,
              onGenerateRoute: RouteGenerator.generateRoute,
              debugShowCheckedModeBanner: false,
              themeMode: _themeData,
              theme: ThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.blue,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}
