import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedevs_task/core/utils/pref_utils.dart';
import 'package:wedevs_task/domain/jwt_decoder.dart';
import 'package:wedevs_task/presentation/account_screen/model/profile_update_response_model.dart';
import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';
import 'package:wedevs_task/presentation/sign_in_screen/model/login_response_model.dart';
import 'package:wedevs_task/presentation/sign_up_screen/model/register_response_model.dart';

import '../../../core/errors/error_controller.dart';
import '../../api/api_client.dart';
import 'repository_interface.dart';

class RepositoryData with ErrorController implements RepositoryInterface {
  final apiClient = ApiClient();

  @override
  Future<List<ProductDetailsModel>> returnData() async {
    var res = await rootBundle.loadString("assets/response.json");
    var data = productDetailsModelFromJson(res);
    print(data.length);
    return data;
  }

  @override
  Future<LoginResponseModel> login(String userName, String password) async {
    Map<String, dynamic> body = {};
    try {
      var response = await apiClient.postData("jwt-auth/v1/token/?username=$userName&password=$password", body, useBearerToken: false);
      var loginResponse = loginResponseModelFromJson(response);
      return loginResponse;
    } catch (e) {
      handleError(e);
      throw Exception('Error in login: $e');
    }
  }

  @override
  Future<RegisterResponseModel> register(String userName, String email, String password) async {
    Map<String, dynamic> body = {"username": userName, "email": email, "password": password};
    try {
      var response = await apiClient.postData("wp/v2/users/register", body, useBearerToken: false);
      var registerResponse = registerResponseModelFromJson(response);
      return registerResponse;
    } catch (e) {
      handleError(e);
      throw Exception('Error in Register: $e');
    }
  }

  @override
  Future<ProfileUpdateResponseModel> updateProfile(String firstName, String lastName) async {
    Map<String, dynamic> jwtUserInfo = JwtHelper().parseJwt(PrefUtils().getAuthToken());
    String userId = jwtUserInfo['data']['user']['id'];
    Map<String, dynamic> body = {
      "first_name": firstName,
      "last_name": lastName,
    };
    try {
      var response = await apiClient.postData("wp/v2/users/$userId", body, useBearerToken: true);
      var updatedProfileResponse = profileUpdateResponseModelFromJson(response);
      return updatedProfileResponse;
    } catch (e) {
      handleError(e);
      throw Exception('Error in Profile Update: $e');
    }
  }
}
