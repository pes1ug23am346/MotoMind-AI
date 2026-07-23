import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/splash/screens/splash_screen.dart';

class MotoMindApp extends StatelessWidget {
  const MotoMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoMind AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
