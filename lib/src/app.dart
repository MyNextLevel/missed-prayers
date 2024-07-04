import 'package:flutter/material.dart';

import 'core/di/dependency_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Qazo namozlari',
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      locale: const Locale('uz'),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
