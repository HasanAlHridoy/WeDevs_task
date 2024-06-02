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
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                        ),
                        builder: (context) => FilterModal(),
                      );
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

class FilterModal extends StatefulWidget {
  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  Map<String, bool> filters = {
    'Newest': true,
    'Oldest': false,
    'Price low > High': false,
    'Price high > Low': false,
    'Best selling': false,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 3.h,
              width: 47.w,
              decoration: BoxDecoration(
                color: AppColors.bottomSheetBarColor,
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.only(bottom: 20.h),
            ),
          ),
          Text('Filter', style: AppStyles.bodyMediumBlack700),
          SizedBox(height: 10.h),
          Column(
            children: filters.keys.map((String key) {
              return Row(
                children: [
                  Checkbox(
                    value: filters[key],
                    activeColor: AppColors.borderCheckColor,
                    checkColor: AppColors.colorWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: AppColors.borderCheckColor,
                      ),
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        filters[key] = value!;
                      });
                    },
                  ),
                  Text(key),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 61.h),
                    shape: RoundedRectangleBorder(
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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    minimumSize: Size(double.infinity, 61.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: AppStyles.bodyMediumWhite400,
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              //     // primary: Colors.green,
              //     overlayColor: Colors.green,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //   ),
              //   child: Text('Apply'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
