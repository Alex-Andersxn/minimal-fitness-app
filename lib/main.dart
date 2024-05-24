import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_fitness_app/auth/auth.dart';
import 'package:minimal_fitness_app/auth/login_or_register.dart';
import 'package:minimal_fitness_app/firebase_options.dart';
import 'package:minimal_fitness_app/pages/home_page.dart';
import 'package:minimal_fitness_app/pages/profile_page.dart';
import 'package:minimal_fitness_app/pages/users_page.dart';
import 'package:minimal_fitness_app/theme/dark_mode.dart';
import 'package:minimal_fitness_app/theme/light_mode.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        "/login_or_register":(context) => const LoginOrRegister(),
        "/home_page":(context) => HomePage(),
        "/profile_page":(context) => ProfilePage(),
        "/users_page":(context) => const UsersPage(),
      },
    );
  }
}
