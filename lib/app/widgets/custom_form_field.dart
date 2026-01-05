import 'package:bierdygame/app/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'custom_text_field.dart';

/// A fully reusable form field builder.
/// You can use this for text, dropdown, or date fields anywhere in the app.
class CustomFormField extends StatelessWidget {
  final Color? bgcolor;
  final String? label;
  final Color? labelColor;
  final String? hint;
  final List<String>? items; // for dropdown
  final void Function(dynamic)? onChanged; // for dropdown or date
  final bool isDatePicker;
  final bool isDropdown;
  final bool? isLarge;
  final TextStyle? labeltextStyle;
  final TextEditingController? controller;
  final bool? enable;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;

  const CustomFormField({
    super.key,
    this.label,
    this.bgcolor,
    this.hint,
    this.items,
    this.onChanged,
    this.isLarge,
    this.controller,
    this.isDatePicker = false,
    this.isDropdown = false,
    this.labeltextStyle,
    this.labelColor,
    this.enable, this.borderSide,this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    final localController = controller ?? TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",
          style:
              labeltextStyle ??
              AppTextStyles.bodySmall.copyWith(color: labelColor),
        ),
        SizedBox(height: 4.h),

        /// Dropdown Field
        if (isDropdown && items != null)
          CustomDropDownWidget(
            // backgroundColor: AppColors.primary,
            title: hint,
            list: items!,
            valChanged: onChanged ?? (_) {},
          )
        /// Date Picker Field
        else if (isDatePicker)
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                initialDate: DateTime.now(),
              );
              if (pickedDate != null) {
                String formattedDate =
                    "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                localController.text = formattedDate;
                if (onChanged != null) {
                  onChanged!(pickedDate);
                }
              }
            },
            child: AbsorbPointer(
              child: CustomTextField(
                controller: localController,
                borderRadius: borderRadius,
                hintText: hint ?? '',
                suffixIcon: Icon(LucideIcons.calendarRange),
                borderSide: BorderSide(color: AppColors.borderColor),
                hintStyle: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textBlack,
                ), 
              ),
            ),
          )
        /// Normal Text Field
        else
          CustomTextField(
            controller: controller,
            hintText: hint ?? '',
            borderSide:borderSide ?? BorderSide(color: AppColors.borderColor),
            hintStyle: AppTextStyles.bodySmall.copyWith(), 
            isLarge: isLarge,
            enable: enable,
            bgcolor: bgcolor,
            borderRadius: borderRadius,
          ),
      ],
    );
  }
}
