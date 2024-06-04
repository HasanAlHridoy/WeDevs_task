import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';

class CustomContentWithField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const CustomContentWithField({
    super.key,
    required this.hintText,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.bodySmallText2Grey400s16),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(width: 0.5, color: AppColors.colorLightGrey),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.bodySmallText2Grey400,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
      ],
    );
  }
}
