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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(
      AuthenticationRepository()); // Initialize AuthenticationRepository first
  Get.put(LoginController()); // Then initialize LoginController

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    /*routes: {
      '/': (context) => SplashPage(goToPage: '/welcome', duration: 3),
      '/welcome': (context) => WelcomePage()
    },*/
    getPages: [GetPage(name: '/welcome', page: () => WelcomePage())],
    home: SplashPage(duration: 3, goToPage: '/welcome'),
  ));
}
