import 'package:bierdygame/app/modules/superAdmin/profile/view/edit_profile_screen.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/controller/super_admin_bot_nav_controller.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  SizedBox(width: 140.w,),
                  Text("Profile", style: AppTextStyles.miniHeadings),
                ],
              ),
              SizedBox(height: 18.h),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                width: double.infinity,
                decoration: _cardDecoration(),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/white_logo.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Aiden Ross",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Super Admin",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomElevatedButton(
                      onPressed: () {
                        Get.to(() => EditProfileScreen());
                      },
                      btnName: "Edit",
                      icon: Icon(Icons.edit_outlined, color: AppColors.primary),
                      textColor: AppColors.primary,
                      width: 140.w,
                      height: 40,
                      borderRadius: 50.r,
                      backColor: Colors.transparent,
                      borderColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 16),
        
              Container(
                padding: const EdgeInsets.all(16),
                decoration: _cardDecoration(),
                child: Column(
                  children: const [
                    _InfoTile(
                      icon: Icons.person,
                      label: "Full Name",
                      value: "Aiden Ross",
                    ),
                    Divider(),
                    _InfoTile(
                      icon: Icons.email,
                      label: "Email",
                      value: "Aidenross@Birdiegame.com",
                    ),
                    Divider(),
                    _InfoTile(
                      icon: Icons.phone,
                      label: "Phone Number",
                      value: "+1 (201) 785612",
                    ),
                    Divider(),
                    _InfoTile(
                      icon: Icons.business,
                      label: "Organization",
                      value: "Birdie Game",
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 16),
        
              Container(
                decoration: _cardDecoration(),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onTap: () {
                    // logout logic
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
