import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_constant.dart';
import 'app_exceptions.dart';

mixin ErrorController {
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
