import 'package:get/get.dart';

class LanguageController extends GetxController {
  RxBool isEnglish = false.obs;
  RxBool switchValue = false.obs;

  toggleLanguage(bool value) {
    isEnglish.value = !isEnglish.value;
    switchValue.value = value;
  }
}

