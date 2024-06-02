import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/widgets/app_bar/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 4,
                  child: SizedBox.shrink(),
                ),
                Expanded(
                    flex: 8,
                    child: Text(
                      'Product List',
                      style: AppStyles.bodyLarge700,
                    )),
                Expanded(
                  flex: 0,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: SvgPicture.asset(
                      ImageConstant.searchImg,
                      color: AppColors.colorDeepBlue,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30.0.h),
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
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.colorLightGrey),
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
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
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 295.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/test.png',
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: 170.h,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 8.h, 0, 8.h),
                            child: Text(
                              'Girls Stylish Dresses',
                              style: AppStyles.bodySmallBlack400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.w, 8.h, 0, 8.h),
                            child: Row(
                              children: [
                                Text(
                                  '\$150',
                                  style: AppStyles.bodySmallGrey400,
                                ),
                                SizedBox(width: 8.w),
                                Text('\$79.00', style: AppStyles.bodyMediumBlack700),
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
          ],
        ),
      ),
    );
  }
}
