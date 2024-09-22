import 'package:quran_app/model/common/resource.dart';

abstract class AuthAPIAbstract {
  Future<Resource> callLogin(input);
  Future<Resource> SignUpRequest(input);
}

abstract class ProductAPIAbstract {
  Future<Resource> getProductList(input);
}