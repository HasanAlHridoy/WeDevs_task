import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/widgets/app_bar/custom_social_button.dart';
import 'package:wedevs_task/widgets/app_bar/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Center(
          child: CustomSocialButton(
            imgPath: ImageConstant.facebookImg,
            color: AppColors.colorFB,
          ),
        ),
      ),
    );
  }
}
