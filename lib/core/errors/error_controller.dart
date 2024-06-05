import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/color_constant.dart';
import 'app_exceptions.dart';

mixin ErrorController {
  static customSnackbar({required title, required msg, Color? color}) {
    return Get.snackbar(
      title,
      msg,
      backgroundColor: color,
      colorText: AppColors.colorWhite,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(8.r),
    );
  }

  void handleError(error) {
    if (error is BadRequestException) {
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
    } else if (error is FetchDataException) {
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
    } else if (error is DataNotFoundException) {
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
    } else if (error is ApiNotRespondingException) {
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
    } else if (error is UnauthorizedException) {
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
    }
  }
}
