/*import 'package:apartmaint/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:apartmaint/pages/welcomepage.dart';
import 'package:apartmaint/pages/splashPage.dart';
import 'package:apartmaint/auth/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:apartmaint/controller/loginController.dart';
import 'package:apartmaint/repository/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(LoginController());
  Get.put(AuthenticationRepository());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [GetPage(name: '/welcome', page: () => WelcomePage())],
    home: SplashPage(duration: 3, goToPage: '/welcome'),
  ));
}*/
import 'package:apartmaint/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:apartmaint/pages/welcomepage.dart';
import 'package:apartmaint/pages/splashPage.dart';
import 'package:apartmaint/auth/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:apartmaint/controller/loginController.dart';
import 'package:apartmaint/repository/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.length == 0) {
    await Firebase.initializeApp(
        name: 'ApartMaint', options: DefaultFirebaseOptions.currentPlatform);
  }

  Get.put(
      AuthenticationRepository()); // Initialize AuthenticationRepository first
  Get.put(LoginController()); // Then initialize LoginController

  runApp(GetMaterialApp(
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
    /*routes: {
      '/': (context) => SplashPage(goToPage: '/welcome', duration: 3),
      '/welcome': (context) => WelcomePage()
    },*/
    getPages: [GetPage(name: '/welcome', page: () => WelcomePage())],
    home: SplashPage(duration: 3, goToPage: '/welcome'),
  ));
}
