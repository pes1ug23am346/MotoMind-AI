import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/services/api_service.dart';
import '../../../providers/auth_provider.dart';

class AddBikeScreen extends StatefulWidget {
  const AddBikeScreen({super.key});

  @override
  State<AddBikeScreen> createState() => _AddBikeScreenState();
}

class _AddBikeScreenState extends State<AddBikeScreen> {
  final _nicknameController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  bool _loading = false;

  Future<void> _submit() async {
    setState(() => _loading = true);
    try {
      final token = context.read<AuthProvider>().token;
      await ApiService.post(
        "/vehicles",
        {
          "nickname": _nicknameController.text.trim(),
          "make": _makeController.text.trim(),
          "model": _modelController.text.trim(),
        },
        token: token,
      );
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Bike")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _nicknameController, decoration: const InputDecoration(labelText: "Nickname (e.g. My Splendor)")),
            const SizedBox(height: 12),
            TextField(controller: _makeController, decoration: const InputDecoration(labelText: "Make (e.g. Honda)")),
            const SizedBox(height: 12),
            TextField(controller: _modelController, decoration: const InputDecoration(labelText: "Model (e.g. Shine)")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _submit,
              child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text("Save Vehicle"),
            ),
          ],
        ),
      ),
    );
  }
}
