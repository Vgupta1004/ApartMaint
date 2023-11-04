import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  String goToPage;
  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.pushNamed(context, this.goToPage);
    });
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 44, 220, 32),
        child: Center(
          child: Icon(Icons.home, color: Colors.white, size: 100),
        ),
      ),
    );
  }
}
