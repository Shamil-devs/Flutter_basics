import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'functions.dart';
import 'package:student_hive_sharedpreference/student_model.dart';
import 'Screens/Home_screen.dart';
import 'Screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentAdapter().typeId)) {
    Hive.registerAdapter(StudentAdapter());
  }

  final SharedPreferences sh = await SharedPreferences.getInstance();

  await _cred(sh);

  final bool islogged = sh.getBool('islogged') ?? false;
  runApp(MyApp(islogged: islogged));
}

Future<void> _cred(SharedPreferences sh) async {
  if (sh.getString('username') == null) {
    await sh.setString('username', 'shamil');
    await sh.setString('password', '123');
  }
}

class MyApp extends StatelessWidget {
  final bool islogged;
  const MyApp({super.key, required this.islogged});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentDbProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Students',
        home: islogged ? const Home() : const Login(),
      ),
    );
  }
}