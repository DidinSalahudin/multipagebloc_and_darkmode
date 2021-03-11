import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:example_multibloc/features/applications/app_theme/app_theme_bloc.dart';
import 'package:example_multibloc/features/applications/counter/counter_bloc.dart';
import 'package:example_multibloc/features/presentations/router/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeMode? _themeMode;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CounterBloc, CounterState>(
          listener: (contextLCounter, stateLCounter) {
            print(stateLCounter.value);
          },
        ),
        BlocListener<AppThemeBloc, AppThemeState>(
          listener: (contextLAppTheme, stateLAppTheme) {
            stateLAppTheme.maybeMap(
              orElse: () {},
              appThemeOption: (e) {
                print(e.themeData);
                _themeMode = e.themeData;
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<AppThemeBloc, AppThemeState>(
              builder: (contextBApptheme, stateBApptheme) {
                return DayNightSwitcher(
                  isDarkModeEnabled:
                      _themeMode == ThemeMode.dark ? true : false,
                  onStateChanged: (value) =>
                      BlocProvider.of<AppThemeBloc>(contextBApptheme).add(
                    AppThemeEvent.updateTheme(value),
                  ),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (contextBCounter, stateBCounter) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Home Screen'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    stateBCounter.value.toString(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context).add(
                            CounterEvent.increament(),
                          );
                        },
                        child: Text('Tambah'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(contextBCounter).add(
                            CounterEvent.decrement(),
                          );
                        },
                        child: Text('Kurang'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteGenerator.routeSecond,
                      );
                    },
                    child: Text('Pindah halaman'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
