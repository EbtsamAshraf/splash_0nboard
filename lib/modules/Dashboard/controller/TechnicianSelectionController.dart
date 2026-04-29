import 'package:get/get.dart';

class TechnicianSelectionController extends GetxController {
  // متغير مراقب (Observable) يخزن اسم الفني المختار حالياً.
  // مبدئياً، هنخليه فاضي (مفيش حد مختار).
  var selectedTechnicianName = ''.obs;

  // دالة لتحديث الفني المختار عند الضغط
  void selectTechnician(String name) {
    selectedTechnicianName.value = name;
  }
}