import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialButton extends StatelessWidget {
  final String imgPath;
  Color? color;
  final Function() onTap;

  CustomSocialButton({
    super.key,
    required this.imgPath,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 56.0.w,
        height: 56.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: SvgPicture.asset(
            imgPath,
            color: color,
          ),
        ),
      ),
    );
  }
}
