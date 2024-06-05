import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/domain/jwt_decoder.dart';
import 'package:wedevs_task/presentation/home_screen/controller/home_controller.dart';
import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';
import 'package:wedevs_task/widgets/bottom_nav_bar.dart';

import 'home_widgets/custom_modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  // int itemCount = 0;
  // List<ProductDetailsModel> list = [];

  // getData() async {
  //   list = await RepositoryData().returnData();

  //   setState(() {
  //     itemCount = list.length;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 35.h, 20.w, 0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                Text(
                  'Product List',
                  style: AppStyles.bodyLarge700,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: SvgPicture.asset(
                    ImageConstant.searchImg,
                    color: AppColors.colorDeepBlue,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30.0.h, 0, 0.h),
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                          ),
                          builder: (context) => FilterModal(homeController: homeController,));
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        SvgPicture.asset(ImageConstant.filterImg),
                        SizedBox(width: 8.w),
                        Text('Filter', style: AppStyles.bodySmallText2Grey400s16),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Sort by', style: AppStyles.bodySmallText2Grey400s16),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                              ),
                              builder: (context) => FilterModal(homeController: homeController,));

                        },
                        icon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.colorLightGrey),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: SvgPicture.asset(
                          ImageConstant.drawerImg,
                          color: AppColors.colorDeepBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: GridView.builder(
                    itemCount: homeController.productData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w,
                      mainAxisExtent: 265.h,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        elevation: 2,
                        color: AppColors.colorWhite,
                        surfaceTintColor: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              homeController.productData[index].store.avatar,
                              width: double.infinity,
                              height: 150.h,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                return Image.asset(
                                  ImageConstant.errorImage,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                  height: 150.h,
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(12.w, 8.h, 0, 8.h),
                              child: Text(
                                homeController.productData[index].name,
                                style: AppStyles.bodySmallBlack400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(12.w, 8.h, 0, 4.h),
                              child: Row(
                                children: [
                                  Text(
                                    '\$${homeController.productData[index].regularPrice}',
                                    style: AppStyles.bodySmallGrey400,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text('\$${homeController.productData[index].price}', style: AppStyles.bodyMediumBlack700),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(12.w, 0.h, 0, 8.h),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: AppColors.ratingActiveColor, size: 15.sp),
                                  Icon(Icons.star, color: AppColors.ratingActiveColor, size: 15.sp),
                                  Icon(Icons.star, color: AppColors.ratingActiveColor, size: 15.sp),
                                  Icon(Icons.star, color: AppColors.ratingActiveColor, size: 15.sp),
                                  Icon(Icons.star, color: AppColors.ratingInactiveColor, size: 15.sp),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
