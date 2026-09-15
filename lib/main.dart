import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/utils/cache/cache_constants.dart';
import 'package:otlob/core/utils/cache/cache_helper.dart';
import 'package:otlob/features/profile/models/user_model.dart';
import 'package:otlob/otlob_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Response reesponse =
  //     await Dio().get('https://accessories-eshop.runasp.net/api/auth/me',
  //         options: Options(headers: {
  //           'Authorization':
  //               'Bearer ${await CacheHelper.getSecureData(key: CacheConstants.accessToken)}',
  //         }));

  // print('Response data: ${reesponse.data}');

  // UserModel user = UserModel.fromJson(reesponse.data);
  // print('User name: ${user.fullName}');

  await CacheHelper.init();

  runApp(const Otlob());
}
