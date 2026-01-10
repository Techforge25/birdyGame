import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:bierdygame/app/widgets/status_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildAdminDetailCard(){
  return Container(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                color: AppColors.flashyGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  CircleAvatar(radius: 50),
                  SizedBox(height: 10.h),
                  Text("Admin Name"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.w,
                    children: [
                      Text("Club Name"),
                      Container(
                        height: 10,
                        width: 2,
                        color: AppColors.borderColor,
                      ),
                      Text("Club Name"),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  StatusContainer(status: "Active")
                ],
              ),
            );
}