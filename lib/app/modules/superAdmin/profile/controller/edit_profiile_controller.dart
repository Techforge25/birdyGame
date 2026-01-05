import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  /// ---------------- TEXT CONTROLLERS ----------------
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  /// ---------------- STATES ----------------
  final isLoading = false.obs;

  /// ---------------- INIT ----------------
  @override
  void onInit() {
    super.onInit();

    /// Prefill data (replace with API response)
    nameController.text = "Aiden Ross";
    emailController.text = "aidenross@birdiegame.com";
    phoneController.text = "+1 (201) 785612";
  }

  /// ---------------- SAVE PROFILE ----------------
  void saveProfile() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;

    try {
      /// 🔗 API CALL HERE
      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        "Success",
        "Profile updated successfully",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.back(); // go back to profile screen
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ---------------- RESET PASSWORD ----------------
  void resetPassword() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await Future.delayed(const Duration(seconds: 1));

    Get.back(); // close dialog

    Get.snackbar(
      "Password Reset",
      "A reset password link has been sent to your email",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  /// ---------------- DISPOSE ----------------
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
