import 'package:example_multibloc/features/presentations/core/app_widget.dart';
import 'package:example_multibloc/injections.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    AppWidget(),
  );
}
