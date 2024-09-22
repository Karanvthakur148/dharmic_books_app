import 'dart:async';
import 'dart:convert';
import 'package:form_bloc/form_bloc.dart';
import 'package:quran_app/model/Auth/loginResponse/login_response.dart';
import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/usecases/auth_usecases.dart';
import 'package:quran_app/network/injector/injector.dart';

class CreateAccountFormBloc extends FormBloc<String, String> {
  final tfEmail = TextFieldBloc(
    validators: [emptyValidator, validateEmail],
  );

  final tfUserName = TextFieldBloc(
    validators: [emptyValidator, validateName],
  );

  final tfCreatePassword = TextFieldBloc(
    validators: [emptyValidator],
  );

  final tfPhoneNumber = TextFieldBloc(
    validators: [emptyValidator, validatePhoneNumber],
  );

  CreateAccountFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfUserName,
      tfEmail,
      tfCreatePassword,
      tfPhoneNumber,
    ]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateName(String value) {
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Please enter a valid name (only characters and spaces allowed)';
    }
    return null;
  }

  static String? validatePhoneNumber(String value) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Future<void> onSubmitting() async {
    print("API Requesting.........");
    Resource response = await Injector.resolve<AuthUseCase>().callLogin(
        {
          "email": tfEmail.value,
          "firstName": tfUserName.value,
          "lastName": tfUserName.value,
          "password": tfCreatePassword.value,
          "address":"pune"
        });

    print(response);
    if (response.status!) {
      LoginResponse loginResponse= response.data;
      emitSuccess(successResponse: jsonEncode(loginResponse), canSubmitAgain: true);
    } else {
      emitSuccess(successResponse: jsonEncode(response), canSubmitAgain: true);
    }
  }
}
