import 'package:cross_fit/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/app_router.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  IProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  void logout(context) async {
    final response = await profileRepository.signout();
    response.fold(
      (error) => emit(ProfileError(error.message)),
      (success) {
        emit(ProfileLogoutSuccess());
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      },
    );
  }
}
