import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:bierdygame/app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16,),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: AppColors.flashyblue,
            border: Border.all(color: AppColors.darkBlue),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Admin Password",
                style: AppTextStyles.bodyMedium2.copyWith(
                  color: AppColors.textBlack,
                  fontSize: 22.sp,
                ),
              ),
              Text("Enter New Password"),
              SizedBox(height: 15.h),
              CustomFormField(
                bgcolor: Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.darkBlue, width: 1.5.w),
                hint: "Enter Current Password",
                label: "Current Password",
                labeltextStyle: AppTextStyles.bodyMedium2.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomFormField(
                bgcolor: Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.darkBlue, width: 1.5.w),
                hint: "Enter New Password",
                label: "New Password",
                labeltextStyle: AppTextStyles.bodyMedium2.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 15.h),
              CustomFormField(
                bgcolor: Colors.transparent,
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.darkBlue, width: 1.5.w),
                hint: "Confirm New Password",
                label: "Confirm Password",
                labeltextStyle: AppTextStyles.bodyMedium2.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Password must be at least 8 characters",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.borderColor,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                onPressed: () {},
                btnName: "Update Password",
                backColor: AppColors.darkBlue,
                textColor: AppColors.white,
                borderRadius: 15.r,
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                btnName: "Cancel",
                backColor: AppColors.flashyblue,
                textColor: AppColors.darkBlue,
                borderColor: AppColors.darkBlue,
                borderRadius: 15.r,
              ),
            ],
          ),
        ),
      ),
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
