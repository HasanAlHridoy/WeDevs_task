import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';
import 'package:wedevs_task/presentation/sign_in_screen/model/login_response_model.dart';
import 'package:wedevs_task/presentation/sign_up_screen/model/register_response_model.dart';

abstract class RepositoryInterface {
  Future<List<ProductDetailsModel>> returnData();

  Future<LoginResponseModel> login(String userName, String password);

  Future<RegisterResponseModel> register(String userName, String email, String password);
}
