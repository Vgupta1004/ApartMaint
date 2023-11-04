import 'package:apartmaint/pages/phone_number_input_screen.dart';
import 'package:apartmaint/profile/profilescreen.dart';
import 'package:apartmaint/repository/authentication_repository.dart';
import 'package:get/get.dart';

class securityOTPController extends GetxController {
  static securityOTPController get instance => Get.find();

  void goToPhoneNumberInputScreen() {
    Get.to(() => PhoneNumberInputScreen());
  }

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => ProfileScreen()) : Get.back();
  }
}
