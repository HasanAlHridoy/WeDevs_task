import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/widgets/app_bar/custom_social_button.dart';
import 'package:wedevs_task/widgets/app_bar/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                SvgPicture.asset(
                  height: 50.h,
                  width: 166.w,
                  ImageConstant.logoImg,
                ),
                SizedBox(height: 80.h),
                Text(
                  'Sign In',
                  style: AppStyles.bodyLarge,
                ),
                SizedBox(height: 35.h),
                CustomTextField(hintText: 'Email', imgPath: ImageConstant.inboxImg),
                SizedBox(height: 20.h),
                CustomTextField(
                  hintText: 'Password',
                  imgPath: ImageConstant.passwordImg,
                  obscureText: showPassword ? true : false,
                  suffixIcon: Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 0.0.h, 8.w, 0.h),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                      color: AppColors.hintColor,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      // Will Navigate to Fotgot Password Page
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Text(
                      'Forgot Password?',
                      style: AppStyles.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                ElevatedButton(
                  onPressed: () {},
                  style: AppStyles.buttonStyle,
                  child: Text(
                    'Login',
                    style: AppStyles.bodyMediumWhite500,
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(imgPath: ImageConstant.facebookImg),
                    SizedBox(width: 10.h),
                    CustomSocialButton(imgPath: ImageConstant.googleImg),
                  ],
                ),
                SizedBox(height: 50.h),
                InkWell(
                  onTap: () {},
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Text(
                    'Create New Account',
                    style: AppStyles.bodyMediumLightBlack300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
