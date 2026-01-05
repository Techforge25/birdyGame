import 'package:bierdygame/app/theme/app_colors.dart';
import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ClubsDetailGrid extends StatelessWidget {
  final int value1;
  final int value2;
  final int value3;
  final int value4;

  const ClubsDetailGrid({super.key, required this.value1, required this.value2, required this.value3, required this.value4});

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
        title: "Total Clubs",
        value: value1,
        icon: Icons.golf_course,
      ),
      _buildStatCard(
        title: "Active Admins",
        value: value2,
        icon: Icons.admin_panel_settings_outlined,
      ),
      _buildStatCard(
        title: "Live Games",
        value: value3,
        icon: Icons.sports_esports_outlined,
      ),
      _buildStatCard(
        title: "Blocked Clubs",
        value: value4,
        icon: Icons.block,
        valueColor: Colors.red,
      ),
    ],
  );
  }
  Widget _buildStatCard({
  required String title,
  required int value,
  required IconData icon,
  Color? valueColor,
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
              style: AppTextStyles.bodyMedium
            ),
            Icon(
              icon,
              size: 25,
              color: valueColor ?? AppColors.borderColor,
            ),
          ],
        ),

        const Spacer(),

        // number
        Text(
          value.toString(),
          style: AppTextStyles.heading.copyWith(color: valueColor ?? AppColors.textBlack)
        ),
      ],
    ),
  );
}

}