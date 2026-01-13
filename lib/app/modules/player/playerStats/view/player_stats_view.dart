import 'package:bierdygame/app/modules/clubAdmin/profile/view/club_profile_view.dart';
import 'package:bierdygame/app/modules/player/playerStats/controller/player_stats_controller.dart';
import 'package:bierdygame/app/modules/player/playerStats/widgets/performance_overview_container.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_club_detail_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PlayerStatsView extends GetView<PlayerStatsController> {
  final VoidCallback onBack;
  final Color? color;

  const PlayerStatsView({super.key, required this.onBack, required this.color});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Stats",
            style: AppTextStyles.bodyMedium2.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/images/dashboard_img.png"),),
                Text(
                  "Player Name",
                  style: AppTextStyles.bodyLarge.copyWith(fontSize: 18),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffCFE8DC),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Active button",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Stats Overview", style: AppTextStyles.bodyMedium2),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffCFE8DC), Color(0xffDCEDC8)],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Team Birdies",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.darkGreen,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "315",
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.darkGreen,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "All Time",
                            style: AppTextStyles.bodyMedium2.copyWith(
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ClubsDetailGrid(
                  value1: 0.toString(),
                  value2: 1.toString(),
                  value3: 2.toString(),
                  value4: 9.toString(),
                  color: AppColors.darkGreen,
                  icon1: Icons.sports_golf_outlined,
                  icon2: Icons.trending_up_outlined,
                  icon3: FontAwesomeIcons.trophy,
                  icon4: Icons.star_border_outlined,
                  title1: "Total Games",
                  title2: "Avg Birdies",
                  title3: "Total Wins",
                  title4: "Highest Birdie",
                  textColor: AppColors.textBlack,
                ),
                SizedBox(height: 8.h),
                PerformanceOverviewContainer(),
                SizedBox(height: 8.h,),
                ListTile(
                  trailing: IconButton(onPressed: (){
                    Get.to(()=>TeamProfileView(onBack: (){
                      Get.back();
                    }));
                  }, icon: Icon(Icons.arrow_forward_ios,color: AppColors.primary,)),
                  tileColor: AppColors.white,
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.sports_golf,color: AppColors.white,),
                ),
                title: Text("Team Eagle",style: AppTextStyles.bodyMedium2,),
                subtitle: Text("member since 2023",style: AppTextStyles.bodySmall,),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
