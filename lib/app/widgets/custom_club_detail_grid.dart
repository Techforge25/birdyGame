import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ClubsDetailGrid extends StatelessWidget {
  final String value1;
  final String value2;
  final String value3;
  final String value4;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final IconData? icon1;
  final IconData? icon2;
  final IconData? icon3;
  final IconData? icon4;
  final Color? textColor;
  final Color? color;
  final double? fontSize;

  const ClubsDetailGrid({
    super.key,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.icon1,
    this.icon2,
    this.icon3,
    this.icon4,
    this.textColor,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 9,
      childAspectRatio: 1.8,
      children: [
        _buildStatCard(
          title: title1 ?? "Total Clubs",
          value: value1,
          icon: icon1 ?? Icons.golf_course,
          color: color,
          fontSize: fontSize,
        ),
        _buildStatCard(
          title: title2 ?? "Active Admins",
          value: value2,
          icon: icon2 ?? Icons.admin_panel_settings_outlined,
          color: color,
          fontSize: fontSize,
        ),
        _buildStatCard(
          title: title3 ?? "Live Games",
          value: value3,
          icon: icon3 ?? Icons.sports_esports_outlined,
          color: color,
          fontSize: fontSize,
        ),
        _buildStatCard(
          title: title4 ?? "Blocked Clubs",
          value: value4,
          icon: icon4 ?? Icons.block,
          valueColor: textColor ?? Colors.red,
          color: color,
          fontSize: fontSize
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    Color? valueColor,
    Color? color,
    double? fontSize,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColorLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: color ?? AppColors.textBlack,
                  fontSize: fontSize ?? 18,
                ),
              ),
              Icon(icon, size: 25, color: valueColor ?? AppColors.borderColor),
            ],
          ),

          const Spacer(),

          // number
          Text(
            value.toString(),
            style: AppTextStyles.heading.copyWith(
              color: valueColor ?? AppColors.textBlack,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
