import 'package:flutter/material.dart';
import '../services/api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmCtrl = TextEditingController();
  String message = "";

  void _register() async {
    if (passCtrl.text != confirmCtrl.text) {
      setState(() {
        message = "Passwords do not match!";
      });
      return;
    }

    final result = await Api.register(emailCtrl.text, passCtrl.text);
    setState(() {
      message = result["message"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            TextField(controller: confirmCtrl, decoration: const InputDecoration(labelText: "Confirm Password"), obscureText: true),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
            Text(message, style: const TextStyle(color: Colors.red)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
