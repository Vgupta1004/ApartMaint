import 'package:flutter/material.dart';
import 'Pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apartment Complex Registration',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Apartment Complex Registration'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/apartment_complex_registration');
            },
            child: Text('Register'),
          ),
        ),
      ),
      routes: {
        '/apartment_complex_registration': (context) => Register(),
      },
    );
  }
}
