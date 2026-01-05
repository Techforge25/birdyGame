import 'package:bierdygame/app/modules/golfClub/components/custom_club_profile_card.dart';
import 'package:bierdygame/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GolfClubProfilePage extends StatelessWidget {
  final String nameOfClub;
  const GolfClubProfilePage({super.key, required this.nameOfClub});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 20,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        centerTitle: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 100.w),
            Text("Club Information", style: AppTextStyles.miniHeadings),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: ListView(
            children: [
              customProfileContainer(nameOfClub: nameOfClub),
              SizedBox(height: 16.h),
              Text("Status", style: AppTextStyles.bodyMedium),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Container(
                        height: 14.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Text("Club Status"),
                    Spacer(),
                    Switch(
                      value: true,
                      onChanged: (t) {},
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      trackColor: WidgetStatePropertyAll(AppColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Club Admins",
                style: AppTextStyles.subHeading.copyWith(fontSize: 20.w),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.flashyGreen,
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(indent: 20, endIndent: 20),
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(),
                        title: Text("name", style: AppTextStyles.bodyMedium),
                        subtitle: Text("location"),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Club Information",
                style: AppTextStyles.subHeading.copyWith(fontSize: 20.w),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.flashyGreen,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("location", style: AppTextStyles.bodySmall),
                              Text(
                                "Austin, Tx",
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Joined Date",
                                style: AppTextStyles.bodySmall,
                              ),
                              Text(
                                DateFormat(
                                  'dd-MM-yyyy',
                                ).format(DateTime.now()).toString(),
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Games",
                                style: AppTextStyles.bodySmall,
                              ),
                              Text("1,124", style: AppTextStyles.bodyMedium),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Player",
                                style: AppTextStyles.bodySmall,
                              ),
                              Text("225", style: AppTextStyles.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Actions",
                style: AppTextStyles.subHeading.copyWith(fontSize: 20.w),
              ),
              SizedBox(height: 16.h),
              Column(
                spacing: 10.5.h,
                children: [
                  CustomElevatedButton(
                    icon: Icon(Icons.save, color: AppColors.white),
                    onPressed: () {},
                    btnName: "Save",
                    backColor: AppColors.primary,
                  ),
                  CustomElevatedButton(
                    icon: Icon(Icons.block, color: AppColors.white),
                    onPressed: () {},
                    btnName: "Block Club",
                    backColor: AppColors.secondary,
                  ),
                  CustomElevatedButton(
                    icon: Icon(Icons.delete, color: AppColors.white),
                    onPressed: () {},
                    btnName: "Remove Club",
                    backColor: AppColors.darkRed,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    btnName: "X Cancel",
                    textColor: AppColors.primary,
                    backColor: Colors.transparent,
                    borderColor: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  
}
