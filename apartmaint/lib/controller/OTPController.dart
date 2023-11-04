import 'package:apartmaint/pages/phone_number_input_screen.dart'; // Import the phone number input screen
import 'package:apartmaint/profile/profilescreen.dart';
import 'package:apartmaint/repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void goToPhoneNumberInputScreen() {
    Get.to(() =>
        PhoneNumberInputScreen()); // Navigate to the phone number input screen
  }

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => ProfileScreen()) : Get.back();
  }
}
