import 'package:get/get.dart';

import 'CreatePasswordController.dart';
class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordController>(() => CreatePasswordController());
  }
}
