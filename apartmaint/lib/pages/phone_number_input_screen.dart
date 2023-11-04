import 'package:apartmaint/auth/otp_screen.dart';
import 'package:apartmaint/controller/loginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartmaint/repository/authentication_repository.dart';

class PhoneNumberInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Phone Number'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: LoginController.instance.phoneNo,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Call the phoneAuthentication method in the login controller
                  LoginController.instance.phoneAuthentication(
                    LoginController.instance.phoneNo.text,
                  );
                  Get.to(OTPScreen());
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
