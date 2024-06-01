import 'package:flutter/material.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
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
      body: Center(
        child: Text('dfff'),
      ),
    );
  }
}
