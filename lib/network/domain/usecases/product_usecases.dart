import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/repo_abstract/api_abstract.dart';

class ProductUseCase{

  final ProductAPIAbstract productAPIAbstract;
  ProductUseCase(this.productAPIAbstract);

  Future<Resource> getProductList(input) async => productAPIAbstract.getProductList(input);

}