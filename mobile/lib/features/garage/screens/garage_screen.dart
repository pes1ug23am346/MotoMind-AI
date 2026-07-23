import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/services/api_service.dart';
import '../../../providers/auth_provider.dart';
import '../../../models/vehicle_model.dart';
import 'add_bike_screen.dart';

class GarageScreen extends StatefulWidget {
  const GarageScreen({super.key});

  @override
  State<GarageScreen> createState() => _GarageScreenState();
}

class _GarageScreenState extends State<GarageScreen> {
  List<VehicleModel> _vehicles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchVehicles();
  }

  Future<void> _fetchVehicles() async {
    setState(() => _loading = true);
    try {
      final token = context.read<AuthProvider>().token;
      final data = await ApiService.get("/vehicles", token: token);
      setState(() {
        _vehicles = (data as List).map((v) => VehicleModel.fromJson(v)).toList();
      });
    } catch (_) {
      // TODO: show a snackbar error
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Garage")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddBikeScreen()),
          );
          _fetchVehicles();
        },
        child: const Icon(Icons.add),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _vehicles.isEmpty
              ? const Center(child: Text("No vehicles yet. Tap + to add one."))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _vehicles.length,
                  itemBuilder: (context, i) {
                    final v = _vehicles[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: const Icon(Icons.two_wheeler),
                        title: Text(v.nickname),
                        subtitle: Text("${v.make} ${v.model} • ${v.odometer.toStringAsFixed(0)} km"),
                      ),
                    );
                  },
                ),
    );
  }
}
