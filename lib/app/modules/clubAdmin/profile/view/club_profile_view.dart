import 'package:bierdygame/app/modules/teamProfile/controller/team_profile_controller.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/custom_club_detail_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TeamProfileView extends GetView<TeamProfileController> {
  final VoidCallback onBack;

  const TeamProfileView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: AppColors.scaffoldBackground,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back_ios, size: 18, color: AppColors.primary),
      ),
      title: Text(
        "Team Stats",
        style: AppTextStyles.bodyMedium2.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
    ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            CircleAvatar(radius: 30),
            Text(
              "Team Name",
              style: AppTextStyles.bodyLarge.copyWith(fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xffCFE8DC),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "Club Name",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Performance Overview",
                style: AppTextStyles.bodyMedium2,
              ),
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
            SizedBox(height: 10.h,),
            ClubsDetailGrid(
              value1: 0.toString(), 
              value2: 1.toString(), 
              value3: 2.toString(), 
              value4: "Alexa Carter",
              color: AppColors.darkGreen,
              icon1: Icons.sports_golf_outlined,
              icon2: Icons.trending_up_outlined,
              icon3: FontAwesomeIcons.trophy,
              icon4: Icons.star_border_outlined,
              title1: "Total Games",
              title2: "Avg Birdies",
              title3: "Total Wins",
              title4: "Top Scorer",
              textColor: AppColors.textBlack,
              ),
              
          ],
        ),
      ),
    );
  }
}
