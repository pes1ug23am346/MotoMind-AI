import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MotoMindApp());
}

class MotoMindApp extends StatelessWidget {
  const MotoMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: "MotoMind AI",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: "/",
        routes: AppRoutes.routes,
      ),
    );
  }
}
