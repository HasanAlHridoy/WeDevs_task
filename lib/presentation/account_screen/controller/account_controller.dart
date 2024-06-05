import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_task/core/errors/error_controller.dart';
import 'package:wedevs_task/core/utils/color_constant.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_interface.dart';

class AccountController extends GetxController{
  final RepositoryInterface _repo = RepositoryData();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  RxBool isLoading = false.obs;
  updateProfile()async{
    firstNameController.clear();
    lastNameController.clear();
    isLoading.value = true;
    await _repo.updateProfile(firstNameController.text, lastNameController.text);
    isLoading.value= false;
  }

}