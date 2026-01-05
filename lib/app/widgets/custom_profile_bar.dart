import 'package:bierdygame/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileBar extends StatelessWidget {
  final VoidCallback onTap;
  final String bgImg;
  final String name;
  const CustomProfileBar({super.key, required this.onTap, required this.bgImg, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                 CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(bgImg),
                ),
                const SizedBox(width: 12),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.miniHeadings,
                    ),
                    Text(
                      "Welcome Back, $name",
                      style: AppTextStyles.bodySmall
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration:  BoxDecoration(
                      color: Color(0xFF00833A),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
  }
}