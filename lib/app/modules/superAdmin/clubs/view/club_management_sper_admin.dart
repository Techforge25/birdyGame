import 'package:bierdygame/app/modules/golfClub/golfClubProfile/golf_club_profile.dart';
import 'package:bierdygame/app/modules/superAdmin/clubs/controller/super_admin_clubs_controller.dart';
import 'package:bierdygame/app/modules/superAdmin/super_admin_bottom_nav/controller/super_admin_bot_nav_controller.dart';
import 'package:bierdygame/app/modules/superAdmin/widgets/add_club_modal.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_tab_bar.dart';
import 'package:bierdygame/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuperAdminClubManagement
    extends GetView<SuperAdminClubManagementController> {
  const SuperAdminClubManagement({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuperAdminClubManagementController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Club Management", style: AppTextStyles.miniHeadings),
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBackground,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.bottomSheet(
            AddClubModal(),
            ignoreSafeArea: true,
            isScrollControlled: true,
          );
        },
        child: Icon(Icons.add, color: AppColors.white, size: 28.h),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              CustomTextField(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search for Clubs...",
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.borderColor,
                ),
                borderSide: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(30.r),
              ),
              SizedBox(height: 15.h),
              Obx(
                () => CustomStatusTabBar(
                  title1: "All",
                  title2: "Active",
                  title3: "Blocked",
                  selectedIndex: controller.selectedTab.value,
                  onChanged: controller.changeTab,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  // If a club is selected, show profile, otherwise show list
                  switch (controller.selectedTab.value) {
                    case 1:
                      return _activeClubs();
                    case 2:
                      return _blockedClubs();
                    default:
                      return _allClubs();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// List of All Clubs
  Widget _allClubs() {
    // Sample data
    final clubs = [
      {"name": "GreenShot Golf Club", "location": "Augusta, GA"},
      {"name": "Emerald Hills Country", "location": "Scottsdale, AZ"},
      {"name": "Sunset Valley Club", "location": "Phoenix, AZ"},
      {"name": "GreenShot Golf Club", "location": "Augusta, GA"},
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        final club = clubs[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.white,
            ),
            child: ListTile(
              leading: const CircleAvatar(),
              title: Text(club["name"]!),
              subtitle: Text(club["location"]!),
              trailing: GestureDetector(
                onTap: () {
                  Get.to(
                    () => GolfClubProfilePage(nameOfClub: club["name"]!),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Active Clubs placeholder
  Widget _activeClubs() => const Text("Active Clubs");

  /// Blocked Clubs placeholder
  Widget _blockedClubs() => const Text("Blocked Clubs");
}
