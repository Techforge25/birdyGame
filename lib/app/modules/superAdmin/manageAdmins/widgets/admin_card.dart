import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminCard extends StatelessWidget {
  const AdminCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Emily Zhang", style: AppTextStyles.bodyMedium),
                  Text(
                    "emilyzhang@greensot.com",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 2),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("Club", style: AppTextStyles.bodyMedium),
                  Text(
                    "GreenShot",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text("Role", style: AppTextStyles.bodyMedium),
                  Text(
                    "Admin",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.borderColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h),
          CustomElevatedButton(
            height: 32,
            onPressed: () {},
            btnName: "Edit",
            backColor: Colors.white,
            borderColor: AppColors.primary,
            borderWidth: 1.5,
            textColor: AppColors.primary,
            borderRadius: 40,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
