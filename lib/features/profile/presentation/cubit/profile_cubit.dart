import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:otlob/core/utils/cache/cache_constants.dart';
import 'package:otlob/core/utils/cache/cache_helper.dart';
import 'package:otlob/features/profile/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  String? userName;

  getProfileData() async {
    try {
      emit(ProfileLoading());
      Response response =
          await Dio().get('https://accessories-eshop.runasp.net/api/auth/me',
              options: Options(headers: {
                'Authorization':
                    'Bearer ${await CacheHelper.getSecureData(key: CacheConstants.accessToken)}',
              }));

      print('Response data: ${response.data}');
      emit(ProfileLoaded(userModel: UserModel.fromJson( response.data)));
       
      UserModel user = UserModel.fromJson(response.data);
      print('User name: ${user.fullName}');
      userName = user.fullName;
    } on Exception catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
      // TODO
    }
  }
}
