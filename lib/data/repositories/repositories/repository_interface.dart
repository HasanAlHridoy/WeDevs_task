import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';

abstract class RepositoryInterface {
  Future<List<ProductDetailsModel>> returnData();
}
