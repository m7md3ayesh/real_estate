import 'package:flutter/material.dart';
import 'package:real_estate/src/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: ThemeData(
        fontFamily: 'lato',
      ),
      routerConfig: AppRouter.router,
    );
  }
}
