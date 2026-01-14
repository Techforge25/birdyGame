import 'package:bierdygame/app/modules/clubAdmin/clubAdminProfile/view/club_profile_view.dart';
import 'package:bierdygame/app/modules/clubAdmin/scores/controller/scores_controller.dart';
import 'package:bierdygame/app/modules/player/playerStats/view/player_stats_view.dart';
import 'package:bierdygame/app/modules/superAdmin/notifications/widgets/notification_tab_bar.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScoresView extends GetView<ScoresController> {
  ScoresView({super.key});
  @override
  final ScoresController controller = Get.put(ScoresController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.showGameDetail.value) {
        return TeamProfileView(onBack: controller.backToGames);
      }
      if (controller.showPlayerRank.value) {
        return PlayerStatsView(onBack: controller.backToGames, color: AppColors.primary,);
      }
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Center(
                child: Text(
                  "LeaderBoard",
                  style: AppTextStyles.bodyLarge.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(height: 10.h),
              NotificationTabBar(
                title1: "Team Rank",
                title2: "Player Rank",
                selectedIndex: controller.selectedTab.value,
                onChanged: controller.changeTab,
              ),
              SizedBox(height: 15.h),
              ListView(
                shrinkWrap: true,
                children: [
                  if (controller.selectedTab.value == 0)
                    GestureDetector(
                      onTap: controller.openTeamRank,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.flashyGreen,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Row(
                          children: [
                            Text("1"),
                            SizedBox(width: 20.w),
                            Text("The Empires"),
                            Spacer(),
                            Text("18 Wins"),
                          ],
                        ),
                      ),
                    ),
                  if (controller.selectedTab.value == 1)
                    GestureDetector(
                      onTap: controller.openPlayerRank,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.flashyGreen,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Row(
                          children: [
                            Text("1"),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Alex Carter"),
                                Text("THe Empires"),
                              ],
                            ),
                            Spacer(),
                            Text("18 Wins"),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
