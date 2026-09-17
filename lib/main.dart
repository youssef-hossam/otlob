import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlob/core/utils/cache/cache_constants.dart';
import 'package:otlob/core/utils/cache/cache_helper.dart';
import 'package:otlob/core/utils/observer.dart';
import 'package:otlob/core/utils/service_locator.dart';
import 'package:otlob/features/profile/models/user_model.dart';
import 'package:otlob/otlob_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locateDependencies();

  Bloc.observer = OtlobObserver();
//  Engine engine = Engine();
//   Car car = Car( engine: engine);
//   car.drive();

//   Car car2 = Car(engine: engine);

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

// debedency injection

// class Engine {
//   start() {
//     print('Engine started');
//   }

// // instance of Engine
//   static final Engine _instance = Engine._();

//   // factory constructor
//   factory Engine() {
//     return _instance;
//   }
// // private constructor
//   Engine._();

  

// }

// class Car {
//   final Engine engine;
//   Car({required this.engine});
//   drive() {
//     engine.start();
//   }
// }
