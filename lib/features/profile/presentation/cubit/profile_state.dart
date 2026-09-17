part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserModel userModel;

  ProfileLoaded({required this.userModel});
}

final class ProfileFailure extends ProfileState {
  String errorMessage;

  ProfileFailure({required this.errorMessage});
}
