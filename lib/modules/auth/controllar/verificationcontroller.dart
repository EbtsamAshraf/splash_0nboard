import 'package:get/get.dart';

import '../../../core/route/app_route.dart';

class VerificationController extends GetxController {
  var otpCode = "".obs;
  void updateOtpCode(String value) {
    otpCode.value = value;
  }

  void verifyCode() {

    if (otpCode.value.length == 6) {
      Get.offNamed(AppRoutes.createNewPassword);
    } else {
      Get.snackbar(
        "تنبيه",
        "يرجى إدخال الكود كاملاً (6 أرقام)",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
