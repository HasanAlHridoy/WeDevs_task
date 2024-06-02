import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';

import '../../presentation/account_screen/account_page.dart';
import '../../presentation/cart_screen/cart_page.dart';
import '../../presentation/category_screen/category_page.dart';
import '../../presentation/home_screen/home_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final screens = [const HomePage(), const CategoryPage(), const CartPage(), const AccountPage()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
        child: BottomAppBar(
          height: 66.h,
          shape: const CircularNotchedRectangle(),
          color: AppColors.colorWhite,
          elevation: 0,
          notchMargin: 8.0.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0.w, 0, 16.0.w, 0),
                    child: InkWell(
                      onTap: () => _onItemTapped(0),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: SvgPicture.asset(
                        ImageConstant.homeImg,
                        width: 27.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        color: _selectedIndex == 0 ? AppColors.selectedBottomBarIconColor : AppColors.bottomBarIconColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.0.w, 0, 0.0.w, 0),
                    child: InkWell(
                      onTap: () => _onItemTapped(1),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: SvgPicture.asset(
                        ImageConstant.categoryImg,
                        width: 27.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        color: _selectedIndex == 1 ? AppColors.selectedBottomBarIconColor : AppColors.bottomBarIconColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0.w, 0, 20.0.w, 0),
                    child: InkWell(
                      onTap: () => _onItemTapped(2),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: SvgPicture.asset(
                        ImageConstant.cartImg,
                        width: 27.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        color: _selectedIndex == 2 ? AppColors.selectedBottomBarIconColor : AppColors.bottomBarIconColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(24.0.w, 0, 10.0.w, 0),
                    child: InkWell(
                      onTap: () => _onItemTapped(3),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: SvgPicture.asset(
                        ImageConstant.accountImg,
                        width: 27.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        color: _selectedIndex == 3 ? AppColors.selectedBottomBarIconColor : AppColors.bottomBarIconColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 56.w,
        height: 56.h,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
