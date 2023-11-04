import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.length == 0) {
    await Firebase.initializeApp(
        name: 'ApartMaint', options: DefaultFirebaseOptions.currentPlatform);
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData.from(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 44, 220, 32),
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 158, 232, 152),
            onSecondary: Colors.white,
            error: Color.fromARGB(255, 251, 118, 118),
            onError: Colors.red,
            background: Colors.white,
            onBackground: Color.fromARGB(255, 44, 220, 32),
            surface: Color.fromARGB(255, 44, 220, 32),
            onSurface: Colors.white)),
    routes: {
      '/': (context) => RegisterPage(),
    },
  ));
}
