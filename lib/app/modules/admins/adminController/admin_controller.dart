import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:bierdygame/app/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  RxBool status = false.obs;
  void resetPassword() {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
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

  void deleteAccount() {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: AppColors.flashyRed,
            border: Border.all(color: AppColors.darkRed),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.flashyRed2,
                      radius: 40.r,
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.darkRed,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Delete Admin",
                      style: AppTextStyles.bodyMedium2.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Text(
                      "This action is permanent and cannot be undone\nAll system access will be removed instantly.",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                onPressed: () {},
                btnName: "Delete Admin",
                backColor: AppColors.darkRed,
                textColor: AppColors.white,
                borderRadius: 15.r,
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                btnName: "Cancel",
                backColor: AppColors.flashyRed,
                textColor: AppColors.darkRed,
                borderColor: AppColors.darkRed,
                borderRadius: 15.r,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void suspendAccount() {
    Get.dialog(
      Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.h),
          decoration: BoxDecoration(
            color: AppColors.flashyYellow,
            border: Border.all(color: AppColors.secondary),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.flashyYellow,
                      radius: 40.r,
                      child: Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.secondary,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Suspend Admin Account",
                      style: AppTextStyles.bodyMedium2.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 8.h),

                    Text(
                      "This admin will temporarily lose access to the system.",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Text(
                      textAlign: TextAlign.center,
                      "You can unsuspend them anytime from Admin Management.",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 13.sp,
                      ),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomElevatedButton(
                onPressed: () {},
                btnName: "Delete Admin",
                backColor: AppColors.secondary,
                textColor: AppColors.white,
                borderRadius: 15.r,
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                btnName: "Cancel",
                backColor: AppColors.flashyYellow,
                textColor: AppColors.secondary,
                borderColor: AppColors.secondary,
                borderRadius: 15.r,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
