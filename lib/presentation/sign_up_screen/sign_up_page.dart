import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/presentation/sign_in_screen/sign_in_page.dart';
import 'package:wedevs_task/widgets/custom_social_button.dart';
import 'package:wedevs_task/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Stack(
                children: [
                  Container(
                    width: 121.0.w,
                    height: 121.0.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        height: 32.h,
                        width: 25.w,
                        ImageConstant.personImg,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4.0.h,
                    right: 4.0.w,
                    child: Container(
                      width: 35.0.w,
                      height: 35.0.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.pink, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: SvgPicture.asset(
                          ImageConstant.cameraImg,
                          // color: color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                hintText: 'Name',
                imgPath: ImageConstant.accountImg,
                controller: nameController,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: 'Email',
                imgPath: ImageConstant.inboxImg,
                controller: emailController,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: 'Password',
                imgPath: ImageConstant.passwordImg,
                controller: passwordController,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hintText: 'Confirm Password',
                imgPath: ImageConstant.passwordImg,
                controller: confirmPasswordController,
              ),
              SizedBox(height: 70.h),
              ElevatedButton(
                onPressed: () {},
                style: AppStyles.buttonStyle,
                child: Text(
                  'Sign Up',
                  style: AppStyles.bodyMediumWhite500,
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSocialButton(
                    imgPath: ImageConstant.facebookImg,
                    onTap: () {},
                  ),
                  SizedBox(width: 10.h),
                  CustomSocialButton(
                    imgPath: ImageConstant.googleImg,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: AppStyles.bodyMediumLightBlack300,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context)
                          .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInPage()), (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Login",
                      style: AppStyles.bodyMediumTextButton700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
