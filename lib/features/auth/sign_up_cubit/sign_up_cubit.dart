import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:otlob/core/networking/api_consumer.dart';
import 'package:otlob/core/networking/api_error_handler.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ApiConsumer apiConsumer;

  SignUpCubit(this.apiConsumer) : super(SignUpInitial());
  sigUp(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      emit(SignUpLoading());
      Response response = await apiConsumer.post(path: 'auth/register', data: {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName
      });

      emit(SignUpSuccess());
    } on DioException catch (e) {
      emit(SignUpFailure(errorMessage: ApiErrorHandeler.handleError(e)));
    }
  }
}
