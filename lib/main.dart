import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'package:flutter_todo_app/screens/welcome_screen.dart';
import 'package:flutter_todo_app/screens/login_screen.dart'; // Sesuaikan dengan nama file login_screen.dart Anda
import '';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set up your logic to determine whether to show the login screen or the home screen.
    bool isLoggedIn = false; // Update this condition based on your authentication status

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: const Color.fromARGB(0, 221, 89, 89)));

    // Use a MaterialApp as the main navigator.
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Aplikasi Agenda',
  home: isLoggedIn ? Home() : WelcomeScreen(), // Use the appropriate widget for the login state
);

  }
}
