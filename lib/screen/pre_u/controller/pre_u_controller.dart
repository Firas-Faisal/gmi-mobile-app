import 'package:get/get.dart';

class PreUController extends GetxController {
  var selectedCategory = 'GAPP'.obs;
  var opacity = 1.0.obs;

  void changeCategory(String newValue) {
    selectedCategory.value = newValue;
    if (newValue == 'GUFP') {
      opacity.value = 0.0;
      Future.delayed(const Duration(milliseconds: 100), () {
        opacity.value = 1.0;
      });
    } else {
      opacity.value = 1.0;
    }
  }
}
