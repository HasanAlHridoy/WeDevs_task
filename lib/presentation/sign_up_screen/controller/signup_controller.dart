import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/core/errors/error_controller.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';
import 'package:wedevs_task/presentation/sign_in_screen/sign_in_page.dart';

class SignUpController extends GetxController {
  final RepositoryInterface _repo = RepositoryData();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  signUp() async {
    if (nameController.text.isEmpty) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Name is Empty', color: Colors.red);
      return;
    }
    if (emailController.text.isEmpty) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Email is Empty', color: Colors.red);
      return;
    }
    if (passwordController.text.isEmpty) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Password is Empty', color: Colors.red);
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ErrorController.customSnackbar(title: 'Failed', msg: 'Password not matched', color: Colors.red);
      return;
    }
    isLoading.value = true;
    await _repo.register(nameController.text, emailController.text, passwordController.text);
    isLoading.value = false;
    Get.snackbar('Success', 'Register Successful', backgroundColor: Colors.green);
    Get.to(() => const SignInPage());
  }
}
