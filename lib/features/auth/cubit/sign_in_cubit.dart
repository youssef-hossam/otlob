import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:otlob/core/networking/api_error_handler.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  signIn({required String email, required String password}) async {
    try {
      emit(SignInLoading());
      Response response = await Dio().post(
          'https://accessories-eshop.runasp.net/api/auth/login',
          data: {"email": email, "password": password});

      emit(SignInSucess());
    } on DioException catch (e) {
      
      emit(SignInFailure(
          errorMessage: ApiErrorHandeler.handleError(
        e,
      )));
    }
  }
}
