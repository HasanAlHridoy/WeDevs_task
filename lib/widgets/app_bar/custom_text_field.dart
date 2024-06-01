import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String imgPath;
  Widget? suffixIcon;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.imgPath,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0.0.h, 12.w, 0.h),
            child: SvgPicture.asset(
              imgPath,
              alignment: Alignment.center,
              color: AppColors.colorFB,
            ),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppStyles.bodyMedium,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
        ),
      ),
    );
  }
}
