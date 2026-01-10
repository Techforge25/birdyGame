import 'package:bierdygame/app/modules/admins/adminController/admin_controller.dart';
import 'package:bierdygame/app/modules/admins/widget/admin_detail_card.dart';
import 'package:bierdygame/app/modules/admins/widget/status_container.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_form_field.dart';
import 'package:bierdygame/app/widgets/custom_text_field.dart';
import 'package:bierdygame/app/widgets/modal_footer_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 18, color: AppColors.primary),
        ),
        title: Text(
          "Admin Edit",
          style: AppTextStyles.bodyMedium2.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  child: Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            buildAdminDetailCard(),
            SizedBox(height: 25.h),
            Text("Edit Admin Details", style: AppTextStyles.bodyMedium2),
            SizedBox(height: 20.h),

            CustomFormField(
              label: "Full Name",
              borderSide: BorderSide(color: AppColors.borderColorLight),
              hint: "Admin Name",
              borderRadius: BorderRadius.circular(12),
              labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),
            CustomFormField(
              label: "Email",
              borderSide: BorderSide(color: AppColors.borderColorLight),
              borderRadius: BorderRadius.circular(12),
              hint: "Admin email",
              labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),
            CustomFormField(
              label: "Club Name",
              borderSide: BorderSide(color: AppColors.borderColorLight),
              borderRadius: BorderRadius.circular(12),
              hint: "Admin Club",
              labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),
            CustomFormField(
              label: "Role",
              borderSide: BorderSide(color: AppColors.borderColorLight),
              borderRadius: BorderRadius.circular(12),
              hint: "Admin Role",
              labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12.h),

            Obx(() => buildWidgetStatus(
                  status: controller.status.value,
                  onChanged: (v) => controller.status.value = v,
                )),

            SizedBox(height: 20.h),
            Text("Account Actions", style: AppTextStyles.bodyMedium2),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      ModalFooterBtn(
        borderColor: AppColors.primary,
        text1: "Save Changes",
        text2: "Cancel",
        onTap1: () {},
        onTap2: () {},
      ),
    ],
  ),
),

    );
  }
}
