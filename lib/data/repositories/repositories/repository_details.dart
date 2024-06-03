import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';
import 'package:wedevs_task/presentation/sign_in_screen/model/login_response_model.dart';

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
    try {
      var response = await apiClient.postData("jwt-auth/v1/token/?username=$userName&password=$password", useBearerToken: false);
      var loginResponse = loginResponseModelFromJson(response);
      return loginResponse;
    } catch (e) {
      handleError(e);
      throw Exception('Error in login: $e');
    }
  }
}
