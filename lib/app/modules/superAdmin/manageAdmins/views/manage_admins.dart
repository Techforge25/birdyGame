import 'package:bierdygame/app/modules/superAdmin/manageAdmins/controller/manage_admin_controller.dart';
import 'package:bierdygame/app/modules/superAdmin/manageAdmins/widgets/admin_card.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBackground,
        surfaceTintColor: Colors.white,
        title: Text("Admins Information", style: AppTextStyles.miniHeadings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            AdminCard(),
          ],
        ),
      ),
    );
  }
}
