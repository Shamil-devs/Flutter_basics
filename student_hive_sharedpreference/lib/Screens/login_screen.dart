import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _name = TextEditingController();
  final _pass = TextEditingController();

  Future<void> validate() async {
    String username = _name.text.trim();
    String password = _pass.text;

    final SharedPreferences sh = await SharedPreferences.getInstance();
    final storedname = sh.getString('username');
    final storedpass = sh.getString('password');

    if (username == storedname && password == storedpass) {
      await sh.setBool('islogged', true);
      if (mounted) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Wrong'),
            content: const Text('Wrong username or password'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            TextField(
              controller: _name,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: validate, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}