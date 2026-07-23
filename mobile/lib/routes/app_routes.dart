import 'package:flutter/material.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/dashboard/screens/home_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => const SplashScreen(),
    "/login": (context) => const LoginScreen(),
    "/register": (context) => const RegisterScreen(),
    "/home": (context) => const HomeScreen(),
  };
}
