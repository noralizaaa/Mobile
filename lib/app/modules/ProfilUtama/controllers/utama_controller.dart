import 'package:get/get.dart';

class UtamaController extends GetxController {
  var fullName = 'Mark'.obs;
  var dateOfBirth = '02/08/1999'.obs;
  var email = 'rem@webmail.com'.obs;
  var phoneNumber = '+620000000'.obs;

  void updateProfile() {
    // Logic untuk memperbarui profil
    Get.snackbar('Success', 'Profile updated successfully!',
        snackPosition: SnackPosition.BOTTOM);
  }
}