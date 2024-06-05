import 'package:get/get.dart';
import 'package:wedevs_task/data/repositories/repositories/repository_details.dart';
import 'package:wedevs_task/presentation/home_screen/product_model/product_model.dart';

class HomeController extends GetxController {
  int itemCount = 0;
  RxList<ProductDetailsModel> productData = <ProductDetailsModel>[].obs;
  RxMap<String, bool> filters = {
    'Newest': false,
    'Oldest': false,
    'Price low > High': false,
    'Price high > Low': false,
    'Best selling': false,
  }.obs;

  getData() async {
    productData.value = await RepositoryData().returnData();
  }

  filter() {
    if (filters['Newest'] == true) {
      productData.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
    } else if (filters['Oldest'] == true) {
      productData.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
