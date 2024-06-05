import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:wedevs_task/core/errors/error_controller.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';
import 'package:wedevs_task/widgets/bottom_nav_bar.dart';

import '../model/login_response_model.dart';

class SignInController extends GetxController {
  final RepositoryInterface _repo = RepositoryData();
  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signIn() async {
    if (emailController.text.isEmpty) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Email/ UserName is Empty', color: Colors.red);
      return;
    }
    if (passwordController.text.isEmpty) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Password is Empty', color: Colors.red);
      return;
    }
    isLoading.value = true;
    LoginResponseModel loginInfo = await _repo.login(emailController.text, passwordController.text);
    PrefUtils().setAuthToken(loginInfo.token);
    isLoading.value = false;
    if (PrefUtils().getAuthToken().isNotEmpty) {
      Get.offAll(() => CustomBottomNavBar());
    }
  }
}
