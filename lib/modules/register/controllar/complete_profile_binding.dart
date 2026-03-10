import 'package:get/get.dart';

import 'CompleteProfileController.dart';
import 'RegisterController.dart';

class CompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());  }
}