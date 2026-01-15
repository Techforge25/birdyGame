import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Controllers for text fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isPasswordHidden = true.obs;
final isConfirmPasswordHidden = true.obs;


  var isLoading = false.obs;

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Optional: update display name
      await userCredential.user?.updateDisplayName(
        nameController.text.trim(),
      );

      Get.snackbar("Success", "Account created successfully");

      // Navigate after signup
      // Get.offAll(() => HomeView());

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Signup Failed", e.message ?? "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
  

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
