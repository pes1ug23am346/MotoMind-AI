import 'package:motomind_ai/features/dashboard/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:motomind_ai/core/widgets/custom_text_field.dart';
import 'package:motomind_ai/core/widgets/primary_button.dart';

import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.two_wheeler,
                    size: 90,
                    color: Color(0xFF2563EB),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Welcome Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 40),

                  const CustomTextField(
                    hint: "Email",
                    icon: Icons.email,
                  ),

                  const SizedBox(height: 20),

                  const CustomTextField(
                    hint: "Password",
                    icon: Icons.lock,
                    obscureText: true,
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Forgot Password screen will be added later
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF2563EB),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      print("Before Navigation");

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );

                      print("After Navigation");
                    },
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: const [
                      Expanded(
                        child: Divider(color: Colors.white24),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white24),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    height: 55,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.g_mobiledata,
                        size: 30,
                      ),
                      label: const Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}