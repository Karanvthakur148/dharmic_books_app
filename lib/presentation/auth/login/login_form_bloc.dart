import 'dart:async';
import 'dart:convert';
import 'package:form_bloc/form_bloc.dart';
import 'package:quran_app/model/Auth/loginResponse/login_response.dart';
import 'package:quran_app/model/common/resource.dart';
import 'package:quran_app/network/domain/usecases/auth_usecases.dart';
import 'package:quran_app/network/injector/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final tfEmail = TextFieldBloc(validators: [
    emptyValidator,
    validateEmail,
  ]);
  final tfPassword = TextFieldBloc(validators: [emptyValidator]);

  LoginFormBloc() : super(autoValidate: true) {
    addFieldBlocs(fieldBlocs: [
      tfEmail,
      tfPassword,
    ]);
  }

  static String? emptyValidator(dynamic value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return "Please enter a valid email address";
    }
    // the email is valid
    return null;
  }

  @override
  FutureOr<void> onSubmitting() async {
    print("API Requesting.........");
    Resource response = await Injector.resolve<AuthUseCase>().callLogin(
        {"email": tfEmail.value, "password": tfPassword.value});

    print(response);
    if (response.status!) {
     LoginResponse loginResponse= response.data;
      emitSuccess(successResponse: jsonEncode(loginResponse), canSubmitAgain: true);
    } else {
      emitSuccess(successResponse: jsonEncode(response), canSubmitAgain: true);
    }
  }
}
