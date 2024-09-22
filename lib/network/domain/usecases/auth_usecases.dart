import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/repo_abstract/api_abstract.dart';

class AuthUseCase {

  final AuthAPIAbstract apiAbstract;
  AuthUseCase(this.apiAbstract);

  Future<Resource> callLogin(input) async => apiAbstract.callLogin(input);
  Future<Resource> SignUpRequest(input) async => apiAbstract.callLogin(input);

}