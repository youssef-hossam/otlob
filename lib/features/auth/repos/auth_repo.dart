import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/networking/api_error_handler.dart';
import 'package:otlob/core/utils/display_awesome_dialog.dart';

class AuthRepo {
  Dio dio = Dio();

  signUp(
    BuildContext context, {
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      Response response = await dio.post(
          'https://accessories-eshop.runasp.net/api/auth/register',
          data: {
            "email": email,
            "password": password,
            "firstName": firstName,
            "lastName": lastName
          });

      print('success--------------------------------------------');
      displayAwesomeDialog(context,
          errorMessage: null, meesage: 'Account created successfully');
    } on DioException catch (e) {
      ApiErrorHandeler.handleError(
        e,
      );
    }
  }

  signIn(BuildContext context,
      {required String email, required String password}) async {
    try {
      Response response = await dio.post(
          'https://accessories-eshop.runasp.net/api/auth/login',
          data: {"email": email, "password": password});
    } on DioException catch (e) {
      ApiErrorHandeler.handleError(
        e,
      );
    }
  }
}
