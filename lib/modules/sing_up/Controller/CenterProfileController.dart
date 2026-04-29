import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';

import '../../../core/route/app_route.dart';

class CenterProfileController extends GetxController {
  final centerNameController = TextEditingController();
  final taxIdController = TextEditingController();
  final addressController = TextEditingController();

  var accreditationFile = "".obs;
  var licenseFile = "".obs;

  void saveAndContinue() {
    if (centerNameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter center name");
      return;
    }

    Get.toNamed("/professionalDetails");
  }

  @override
  void onClose() {
    centerNameController.dispose();
    taxIdController.dispose();
    addressController.dispose();
    super.onClose();
  }
}



class CompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CenterProfileController>(() => CenterProfileController());
  }
}