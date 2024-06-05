import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';
import 'package:wedevs_task/widgets/bottom_nav_bar.dart';

import '../model/login_response_model.dart';

class SignInController extends GetxController{
  final RepositoryInterface _repo = RepositoryData();
  RxBool showPassword = true.obs;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signIn()async{
    if (emailController.text.isEmpty) {
      // Get.snackbar('Failed', 'Email/ UserName is Empty');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Email/ UserName is Empty'), backgroundColor: Colors.red),
      // );
      return;
    }
    if (passwordController.text.isEmpty) {
      // Get.snackbar('Failed', 'Password is Empty');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Password is Empty'), backgroundColor: Colors.red),
      // );
      return;
    }
    isLoading.value = true;
    LoginResponseModel loginInfo = await _repo.login(emailController.text, passwordController.text);
    PrefUtils().setAuthToken(loginInfo.token);
    isLoading.value = false;

  }
}