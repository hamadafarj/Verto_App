import 'package:get/get.dart';

enum Gender { male, female }

class GenderController extends GetxController {
  var gender = Gender.male.obs;

  void setGender(Gender value) {
    gender.value = value;
  }
}