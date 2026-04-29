import 'package:get/get.dart';

class RoleController extends GetxController {
  var selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }

  void proceed() {
    if (selectedRole.value == 'Center') {
      Get.toNamed('/login');
    } else if (selectedRole.value == 'Patient') {
      Get.snackbar("تنبيه", "صفحة المريض تحت الإنشاء");
    } else {
      Get.snackbar("خطأ", "من فضلك اختاري نوع الحساب أولاً");
    }
  }
}