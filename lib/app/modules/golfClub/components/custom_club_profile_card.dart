import 'package:bierdygame/app/modules/golfClub/components/clud_edit_modal.dart';
import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget customProfileContainer({
  required String nameOfClub
}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Leading circle
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nameOfClub,
                  style: AppTextStyles.bodyLarge.copyWith(fontSize: 20),
                ),
                SizedBox(height: 4),
                Text("Golf Club", style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                ClubEditModal(),
                ignoreSafeArea: true,
                isScrollControlled: true,
              );
            },
            child: Icon(Icons.edit_outlined, color: AppColors.primary),
          ),
        ],
      ),
    );
  }