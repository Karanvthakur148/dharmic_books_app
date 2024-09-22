import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/remote/product_network.dart';
import 'package:quran_app/network/domain/repo_abstract/api_abstract.dart';

class ProductRepository extends ProductAPIAbstract {
  final ProductNetwork productNetwork;

  ProductRepository({
    required this.productNetwork,
  });

  @override
  Future<Resource> getProductList(data) async {
    try {
      final response = await productNetwork.getProductList(data);
      return Resource(
          data: response,
          status: true);
    } catch (error) {
      return Resource(status: false);
    }
  }
}