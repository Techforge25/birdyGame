import 'package:bierdygame/app/modules/auth/controller/auth_controller.dart';
import 'package:bierdygame/app/modules/auth/view/signUpView/sign_up.dart';
import 'package:bierdygame/app/modules/clubAdmin/clubAdminBottomNav/view/club_admin_bottom_nav.dart';
import 'package:bierdygame/app/modules/player/playerBottomNav/view/player_bottom_nav.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/view/super_admin_bottom_nav.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:bierdygame/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInView extends GetView<AuthController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/white_logo.png')),
            SizedBox(height: 40.h),
            Center(child: Text("Welcome Back", style: AppTextStyles.bodyLarge)),
            Center(
              child: Text(
                "Sign in to continue your game",
                style: AppTextStyles.bodyMedium,
              ),
            ),
            SizedBox(height: 30.h),
            CustomTextField(
              controller: controller.emailController,
              hintText: "Enter your email",
              prefixIcon: Icon(Icons.mail_outline, color: AppColors.primary),
              bgcolor: AppColors.textFieldBgColor,
              borderSide: BorderSide(
                color: AppColors.borderColorLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              controller: controller.passwordController,
              hintText: "Enter Your Password",
              prefixIcon: Icon(
                Icons.password_outlined,
                color: AppColors.primary,
              ),
              suffixIcon: Icon(Icons.visibility_outlined),
              bgcolor: AppColors.textFieldBgColor,
              borderSide: BorderSide(
                color: AppColors.borderColorLight,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),

            SizedBox(height: 10.h),
            Text(
              "Forget Password ?",
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 13,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 40.h),
            CustomElevatedButton(
              onPressed: () {
                final email = controller.emailController.text.trim();

                if (email == "superadmin123@gmail.com") {
                  Get.offAll(() => SuperAdminBottomNav());
                } else if (email == "clubadmin123@gmail.com") {
                  Get.offAll(() => ClubAdminBottomNav());
                } else if (email == "player123@gmail.com"){
                  Get.offAll(() => PlayerBottomNav());
                }else{
                  Get.snackbar("Enter Email",'superadmin123@gmail.com" for superadmin "clubadmin123@gmail.com" for Club Admin and player123@gmail.com for player');
                }
              },
              btnName: "Login",
            ),

            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: AppTextStyles.bodySmall,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpView());
                  },
                  child: Text(
                    "Sign Up",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
