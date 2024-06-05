import 'package:get/get.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';

class HomeController extends GetxController {
  int itemCount = 0;
  RxList<ProductDetailsModel> productData = <ProductDetailsModel>[].obs;

  getData() async {
    productData.value = await RepositoryData().returnData();
  }

  filter() {
    
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
