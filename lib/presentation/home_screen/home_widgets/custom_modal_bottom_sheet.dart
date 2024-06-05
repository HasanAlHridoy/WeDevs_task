import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/styles.dart';
import 'package:wedevs_task/presentation/home_screen/controller/home_controller.dart';

import '../product_model/product_model.dart';

class FilterModal extends StatelessWidget {
  final HomeController homeController;

  const FilterModal({super.key, required this.homeController});

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
          Padding(
            padding: EdgeInsets.only(left: 8.0.w),
            child: Text('Filter', style: AppStyles.bodyMediumBlack700),
          ),
          SizedBox(height: 8.h),
          Obx(
            () => Column(
              children: homeController.filters.keys.map((String key) {
                return Row(
                  children: [
                    Transform.scale(
                      scale: 1.1.r,
                      child: Checkbox(
                        value: homeController.filters[key],
                        activeColor: AppColors.borderCheckColor,
                        checkColor: AppColors.colorWhite,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(
                          color: AppColors.borderCheckColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (bool? value) {
                          // setState(() {
                          homeController.filters[key] = value!;
                          // });
                        },
                      ),
                    ),
                    Text(
                      key,
                      style: AppStyles.bodySmallBlack400f15,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 50.h),
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
                child: ElevatedButton(
                  onPressed: () {
                    homeController.filter();
                    // if (filters['Newest'] == true) {
                    //   widget.homeController.productData.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
                    // } else if (filters['Oldest'] == true) {
                    //   widget.homeController.productData.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
                    // }
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
            ],
          ),
        ],
      ),
    );
  }
}
