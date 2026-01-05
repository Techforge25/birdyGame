import 'package:bierdygame/app/modules/superAdmin/manageAdmins/controller/manage_admin_controller.dart';
import 'package:bierdygame/app/modules/superAdmin/manageAdmins/widgets/admin_card.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/controller/super_admin_bot_nav_controller.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManageAdmins extends GetView<ManageAdminsController> {
  const ManageAdmins({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ManageAdminsController());
    return Scaffold(
     
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Go back to Dashboard tab
                      Get.find<SuperAdminBotNavController>().changeTab(0);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  Text("Admins Information", style: AppTextStyles.miniHeadings),
                ],
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search Admin...",
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.borderColor,
                ),
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(30.r),
              ),
              SizedBox(height: 15.h),
              AdminCard()
              
            ],
          ),
        ),
      ),
    );
  }

 

  
}
