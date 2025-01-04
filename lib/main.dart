import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/config/routes/routes_config.dart';
import 'package:rick_and_morty/core/di/get_it.dart';

import 'core/config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick and Morty',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesConfig.router,
    );
  }
}
