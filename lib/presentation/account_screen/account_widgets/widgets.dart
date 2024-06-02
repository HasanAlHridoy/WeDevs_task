import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';

class CustomExpansionTile extends StatelessWidget {
  final String imgPath;
  final String title;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.imgPath,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        collapsedIconColor: AppColors.arrowColor,
        leading: SvgPicture.asset(
          imgPath,
          width: 24.w,
          height: 24.h,
          color: AppColors.iconColor,
        ),
        title: Text(
          title,
          style: AppStyles.bodyMediumBlack400,
        ),
        children: children,
      ),
    );
  }
}
