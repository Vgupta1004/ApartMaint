import 'package:apartmaint/controller/adminOTPController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:apartmaint/controller/adminOTPController.dart';

class AdminOTPScreen extends StatelessWidget {
  const AdminOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adminOTPController otpController = Get.put(adminOTPController());
    var otp;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Admin\nVerification',
              style: TextStyle(
                color: Color.fromARGB(255, 44, 220, 32),
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            Text('Enter the verification code', textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
              },
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () {
                  otpController.verifyOTP(otp);
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Color.fromARGB(255, 44, 220, 32),
                  padding: EdgeInsets.symmetric(horizontal: 160, vertical: 25),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Next', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
