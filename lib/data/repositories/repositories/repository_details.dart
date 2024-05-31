import 'dart:convert';

import '../../../core/errors/error_controller.dart';
import '../../api/api_client.dart';
import 'repository_interface.dart';

class RepositoryData with ErrorController implements RepositoryInterface {
  final apiClient = ApiClient();
}
