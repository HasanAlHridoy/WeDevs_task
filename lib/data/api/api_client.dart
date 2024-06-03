import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../core/errors/app_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String? get baseUrl => "https://apptest.dokandemo.com/wp-json/wp/v2/";

  Future<dynamic> getData(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer ' '}',
      },
    );
    if (response.statusCode == 200) {
      String responseBody = response.body;
      return responseBody;
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('Error in getData => ${response.statusCode}');
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> data) async {
    try {
      // We can use token later
      // final headers = useBearerToken
      //     ? {
      //         'Authorization': 'Bearer ''}',
      //       }
      //     : {};

      Response response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Authorization': 'Bearer ' '}',
        },
        body: json.encode(data),
      );
      var responseJson = _processResponse(response);
      return responseJson;
    } catch (e) {
      print("Error in postData: $e");
      throw e;
    }
  }
}

_processResponse(Response response) async {
  switch (response.statusCode) {
    case 200:
      SnackBar(content: const Text('Succes'), backgroundColor: Colors.green);
      var resJson = response.body;
      return resJson;
    case 400:
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
      throw BadRequestException(response.body, response.request?.url.toString());
    case 401:
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['errors']['message'];
      throw UnauthorizedException(errorMessage, response.request?.url.toString());
    case 404:
      SnackBar(content: const Text('Error'), backgroundColor: Colors.red);
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['errors']['message'];
      throw DataNotFoundException(errorMessage, response.request?.url.toString());
    case 500:
    default:
      throw FetchDataException("Error occurred with code: ${response.statusCode}", response.request?.url.toString());
  }
}
