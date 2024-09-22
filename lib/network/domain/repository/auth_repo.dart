
import 'dart:convert';

import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/remote/auth_network.dart';
import 'package:quran_app/network/domain/repo_abstract/api_abstract.dart';

class AuthRepository extends AuthAPIAbstract {
  final AuthNetwork apiRemoteDatasource;

  AuthRepository({
    required this.apiRemoteDatasource,
  });

  Future<Resource> callLogin(data) async {
    try {
      final response = await apiRemoteDatasource.loginRequest(data);
      print('Response from repo');
      print(jsonEncode(response.data));
      return Resource(
          data: response,
          status: true);
    } catch (error) {
      return Resource(status: false);
    }
  }

  Future<Resource> SignUpRequest(data) async {
    try {
      final response = await apiRemoteDatasource.SignUpRequest(data);
      print('Response from repo');
      print(jsonEncode(response.data));
      return Resource(
          data: response,
          status: true);
    } catch (error) {
      return Resource(status: false);
    }
  }


}