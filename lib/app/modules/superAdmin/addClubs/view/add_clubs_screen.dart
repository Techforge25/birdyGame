import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/controller/super_admin_bot_nav_controller.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_form_field.dart';
import 'package:bierdygame/app/widgets/modal_footer_btn.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// ---------------- ADMIN MODEL ----------------
class AdminModel {
  final String name;
  final String email;

  AdminModel({required this.name, required this.email});
}

/// ---------------- CLUB EDIT MODAL ----------------
class AddClubsScreen extends StatefulWidget {
  const AddClubsScreen({super.key});

  @override
  State<AddClubsScreen> createState() => _AddClubsScreenState();
}

class _AddClubsScreenState extends State<AddClubsScreen> {
  final int maxAdmins = 5;

  List<AdminModel> admins = [];

  bool showAddAdminForm = false;

  /// Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// ---------------- ADMIN LIST ----------------
  Widget _adminList() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.flashyGreen,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const Divider(indent: 20, endIndent: 20),
        itemCount: admins.length,
        itemBuilder: (context, index) {
          final admin = admins[index];
          return ListTile(
            leading: const CircleAvatar(),
            title: Text(admin.name, style: AppTextStyles.bodyMedium),
            subtitle: Text(admin.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit_outlined, color: AppColors.primary),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {
                    setState(() => admins.removeAt(index));
                  },
                  child: Icon(Icons.delete, color: AppColors.darkRed),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// ---------------- ADD ADMIN FORM ----------------
  Widget _addAdminForm() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColorLight),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Admin",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12.h),

          CustomFormField(
            label: "Admin Name",
            hint: "Enter admin's full name",
            controller: nameController,
          ),

          SizedBox(height: 12.h),

          CustomFormField(
            label: "Admin Email",
            hint: "Enter admin's email address",
            controller: emailController,
          ),

          SizedBox(height: 12.h),

          CustomFormField(
            label: "Password",
            hint: "Create a password",
            controller: passwordController,
          ),
        ],
      ),
    );
  }

  /// ---------------- SAVE LOGIC ----------------
  void _onSaveChanges() {
    if (!showAddAdminForm) return;
    if (admins.length >= maxAdmins) {
      Get.snackbar("Note", "Only 5 Admins added");
      return;
    }

    setState(() {
      admins.add(
        AdminModel(name: nameController.text, email: emailController.text),
      );

      showAddAdminForm = false;
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.find<SuperAdminBotNavController>().changeTab(0);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 120.w),
            Text("Add new Club", style: AppTextStyles.miniHeadings),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16.0,
                    children: [
                      CustomFormField(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: AppColors.borderColorLight,
                        ),
                        label: "Club Name",
                        hint: "Enter Club Name",
                        labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomFormField(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: AppColors.borderColorLight,
                        ),
                        label: "Location/City",
                        hint: "Enter city",
                        labeltextStyle: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Logo Upload",
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DottedBorder(
                          options: RectDottedBorderOptions(
                            strokeWidth: 2,
                            dashPattern: [6, 6],
                            color: AppColors.primary,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200.h,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10.h,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.flashyGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.upload_file_outlined,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    "Upload the Club Logo",
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Text(
                                    "SVG,PNG,JPG (max. 400x400px)",
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Master Admin Setup",
                      style: AppTextStyles.bodyLarge.copyWith(fontSize: 20.sp),
                    ),
                    Text(
                      "This will create the primary administrator account.",
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
                _adminList(),
                if (showAddAdminForm) _addAdminForm(),
        
                /// ---- ADD BUTTON ----
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: GestureDetector(
                    onTap: () {
                      if (admins.length >= maxAdmins) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Maximum of 5 admins per club"),
                          ),
                        );
                        return;
                      }
                      setState(() => showAddAdminForm = true);
                    },
                    child: Container(
                      height: 40.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.flashyGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "+ Add another Admin",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
        
                SizedBox(height: 8.h),
        
                Center(
                  child: Text(
                    "Maximum of 5 admins per club.",
                    style: AppTextStyles.bodySmall,
                  ),
                ),
                ModalFooterBtn(
                  text1: "Create Club",
                  text2: "Cancel",
                  onTap1: _onSaveChanges,
                  onTap2: () {
                    Get.find<SuperAdminBotNavController>().changeTab(0);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
