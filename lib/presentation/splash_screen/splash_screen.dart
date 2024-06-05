import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/core/utils/image_constant.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/presentation/home_screen/home_page.dart';
import 'package:wedevs_task/presentation/sign_in_screen/sign_in_page.dart';
import 'package:wedevs_task/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (PrefUtils().getAuthToken().isEmpty) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInPage()), (Route<dynamic> route) => false);
      } else {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const CustomBottomNavBar()), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SvgPicture.asset(ImageConstant.logoImg),
        ),
      ),
    );
  }
}
