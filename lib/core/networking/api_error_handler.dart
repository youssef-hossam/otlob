import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/networking/error_model.dart';
import 'package:otlob/core/utils/display_awesome_dialog.dart';

class ApiErrorHandeler {
  static   handleError(DioException e, ) {
    if (e.type case DioExceptionType.badResponse) {
      print('Status Code: ${e.response?.statusCode}');
      switch (e.response?.statusCode) {
        case 400:
          ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
          String errorMessage = '';
          errorModel.errors.forEach((error) => errorMessage += '$error\n');
return errorMessage;
          
        // return errorMessage;
        case 401:
          ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
          String errorMessage = '';
          errorModel.errors.forEach((error) => errorMessage += '$error\n');
          return errorMessage;
        case 403:
          ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
          String errorMessage = '';
          errorModel.errors.forEach((error) => errorMessage += '$error\n');
        return errorMessage;
        case 404:
          ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
          String errorMessage = '';
          errorModel.errors.forEach((error) => errorMessage += '$error\n');
      return errorMessage;
        case 422:
          ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
          String errorMessage = '';
          errorModel.errors.forEach((error) => errorMessage += '$error\n');
         return errorMessage;

        case 500:
          return 'Internal Server Error';
      }

      print('Status Code: ${e.response?.statusCode}');
      ErrorModel errorModel = ErrorModel.fromJson(e.response!.data);
      print('Status Code: ${errorModel.statusCode}');
      print('Message: ${errorModel.errors}');
      String errorMessage = '';
      errorModel.errors.forEach((error) => errorMessage += '$error\n');
    } else if (e.type case DioExceptionType.connectionTimeout) {
      return 'Connection timed out. Please try again later.';
    } else if (e.type case DioExceptionType.receiveTimeout) {
      return 'Connection timed out. Please try again later.';
    } else if (e.type case DioExceptionType.sendTimeout) {
      return 'Connection timed out. Please try again later.';
    } else if (e.type case DioExceptionType.unknown) {
      return 'An unexpected error occurred. Please try again later.';
    } else if (e.type case DioExceptionType.cancel) {
      return 'Request was cancelled. Please try again later.';
    }
  }
}
