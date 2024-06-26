import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';
import 'package:wedevs_task/presentation/account_screen/controller/account_controller.dart';

import 'account_widgets/custom_content_field_widget.dart';
import 'account_widgets/custom_expansion_tile.dart';
import 'model/profile_update_response_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.put(AccountController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 0),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'My Account',
                  style: AppStyles.bodyLarge700,
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                padding: EdgeInsets.all(5.r),
                // Adjust padding based on the border width
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.imageBorderColor, width: 1),
                ),
                width: 150,
                height: 150,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/test.png', // Path to your image file
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                'John Smith',
                style: AppStyles.bodyLarge900,
              ),
              Text(
                'info@johnsmith.com',
                style: AppStyles.bodySmallGrey400S15,
              ),
              SizedBox(height: 25.h),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CustomExpansionTile(
                      title: 'Account',
                      imgPath: ImageConstant.accountImg,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 8.0.r, 16.w, 8.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomContentWithField(
                                hintText: 'youremail@xmail.com',
                                title: 'Email',
                                controller: accountController.emailController,
                              ),
                              const SizedBox(height: 16),
                              CustomContentWithField(
                                hintText: 'William',
                                title: 'First Name',
                                controller: accountController.firstNameController,
                              ),
                              const SizedBox(height: 16),
                              CustomContentWithField(
                                hintText: 'Bennett',
                                title: 'Last Name',
                                controller: accountController.lastNameController,
                              ),
                              const SizedBox(height: 16),
                              CustomContentWithField(
                                hintText: '465 Nolan Causeway Suite 079',
                                title: 'Street Address',
                                controller: accountController.addressController,
                              ),
                              const SizedBox(height: 16),
                              CustomContentWithField(
                                hintText: 'Apt, Suite, Bldg (optional)',
                                title: 'Unit 512',
                                controller: accountController.unitController,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: (370 / 5).w,
                                child: CustomContentWithField(
                                  hintText: '77017',
                                  title: 'Zip Code',
                                  controller: accountController.zipController,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(double.infinity, 50.h),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 0.5, color: AppColors.colorGrey),
                                          borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
                                        ),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: AppStyles.bodyMedium400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Obx(
                                      () => !accountController.isLoading.value
                                          ? ElevatedButton(
                                              onPressed: () {
                                                accountController.updateProfile();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: AppColors.buttonColor,
                                                minimumSize: Size(double.infinity, 50.h),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
                                                ),
                                              ),
                                              child: Text(
                                                'Apply',
                                                style: AppStyles.bodyMediumWhite400,
                                              ),
                                            )
                                          : Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: const Divider(),
                    ),
                    CustomExpansionTile(
                      title: 'Passwords',
                      imgPath: ImageConstant.passwordImg,
                      children: [],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: const Divider(),
                    ),
                    CustomExpansionTile(
                      title: 'Notification',
                      imgPath: ImageConstant.notificationImg,
                      children: [],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: const Divider(),
                    ),
                    CustomExpansionTile(
                      title: 'Wishlist (00)',
                      imgPath: ImageConstant.heartImg,
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
