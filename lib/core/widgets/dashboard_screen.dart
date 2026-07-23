import 'package:flutter/material.dart';
import 'package:motomind_ai/core/widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1120),
        elevation: 0,
        title: const Text(
          "MotoMind AI",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome 👋",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Your Smart Bike Companion",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.8,
                children: [
                  DashboardCard(
                    icon: Icons.smart_toy,
                    title: "AI Mechanic",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.build,
                    title: "Service Reminder",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.local_gas_station,
                    title: "Fuel Tracker",
                    onTap: () {},
                  ),

                  DashboardCard(
                    icon: Icons.location_on,
                    title: "Nearby Garage",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}