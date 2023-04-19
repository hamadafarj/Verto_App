import 'package:get/get.dart';

enum Gender { male, female }

class SignUpController extends GetxController {
  var gender = Gender.male.obs;
  var isChecked = false.obs;

  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }

  void setGender(Gender value) {
    gender.value = value;
  }

  
}
