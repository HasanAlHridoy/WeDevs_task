import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/presentation/home_screen/home_page.dart';
import 'package:wedevs_task/presentation/sign_in_screen/sign_in_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtils().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(370, 780),
      builder: (_, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WeDevs-Task',
          home: SignInPage(),
        );
      },
    );
  }
}
