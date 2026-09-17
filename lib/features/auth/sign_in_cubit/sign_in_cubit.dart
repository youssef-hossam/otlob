import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:otlob/core/networking/api_consumer.dart';
import 'package:otlob/core/networking/api_error_handler.dart';
import 'package:otlob/core/utils/cache/cache_constants.dart';
import 'package:otlob/core/utils/cache/cache_helper.dart';
import 'package:otlob/features/auth/models/signIn_response_model.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiConsumer apiConsumer;
  SignInCubit({required this.apiConsumer}) : super(SignInInitial());

  signIn({required String email, required String password}) async {
    try {
      Response response = await apiConsumer.post(
          path: 'auth/login', data: {"email": email, "password": password});

      SignInResponseModel signInResponseModel =
          SignInResponseModel.fromJson(response.data);
      CacheHelper.setSecureData(
          key: CacheConstants.accessToken,
          value: signInResponseModel.accessToken ?? '');
 
    } on DioException catch (e) {
      emit(SignInFailure(
          errorMessage: ApiErrorHandeler.handleError(
        e,
      )));
    }
  }
  // signIn({required String email, required String password}) async {
  //   try {
  //     emit(SignInLoading());
  //     Response response = await Dio().post(
  //         'https://accessories-eshop.runasp.net/api/auth/login',
  //         data: {"email": email, "password": password});

  //     print('Response data: ${response.data}');
  //     SignInResponseModel signInResponseModel =
  //         SignInResponseModel.fromJson(response.data);
  //     CacheHelper.setSecureData(
  //         key: CacheConstants.accessToken,
  //         value: signInResponseModel.accessToken ?? '');
  //     CacheHelper.getSecureData(key: CacheConstants.accessToken).then((value) {
  //     log('Access Token from secure storage: $value');
  //     });

  //     emit(SignInSucess());
  //   } on DioException catch (e) {
  //     emit(SignInFailure(
  //         errorMessage: ApiErrorHandeler.handleError(
  //       e,
  //     )));
  //   }
  // }
}
