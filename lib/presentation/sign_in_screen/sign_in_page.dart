import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';
import 'package:wedevs_task/presentation/home_screen/home_page.dart';
import 'package:wedevs_task/presentation/sign_in_screen/controller/signin_controller.dart';
import 'package:wedevs_task/presentation/sign_up_screen/sign_up_page.dart';
import 'package:wedevs_task/widgets/bottom_nav_bar.dart';
import 'package:wedevs_task/widgets/custom_social_button.dart';
import 'package:wedevs_task/widgets/custom_text_field.dart';

import 'model/login_response_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController signInController = Get.put(SignInController());

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
                CustomTextField(
                  hintText: 'Email',
                  imgPath: ImageConstant.inboxImg,
                  controller: signInController.emailController,
                ),
                SizedBox(height: 20.h),
                Obx(
                  () => CustomTextField(
                    hintText: 'Password',
                    imgPath: ImageConstant.passwordImg,
                    obscureText: signInController.showPassword.value ? true : false,
                    suffixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 0.0.h, 8.w, 0.h),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            signInController.showPassword.value = !signInController.showPassword.value;
                          });
                        },
                        icon: signInController.showPassword.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        color: AppColors.hintColor,
                      ),
                    ),
                    controller: signInController.passwordController,
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
                Obx(() => !signInController.isLoading.value
                    ? ElevatedButton(
                        onPressed: () async{
                          await signInController.signIn();
                          if (mounted) {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CustomBottomNavBar()), (Route<dynamic> route) => false);
                          }
                        },
                        style: AppStyles.buttonStyle,
                        child: Text(
                          'Login',
                          style: AppStyles.bodyMediumWhite500,
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )),
                SizedBox(height: 40.h),
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
                SizedBox(height: 50.h),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
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
