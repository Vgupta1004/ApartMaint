import 'package:apartmaint/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/logincontroller.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Form(
        key: _formKey, // Add the form key here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone, // Specify the input type
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Call the phoneAuthentication method from logincontroller
                    controller
                        .phoneAuthentication(controller.phoneNo.text.trim());
                    Get.to(() => OTPScreen());
                  }
                },
                child: Text('Sign Up'.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
