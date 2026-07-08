import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:cness_test/features/profile/domain/usecases/profile_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase profileUsecase;
  ProfileBloc({required this.profileUsecase}) : super(ProfileInitial()) {
    on<ProfileEvent>(onProfileLoadEvent);
  }

  Future<void> onProfileLoadEvent(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    try {
      final result = await profileUsecase.call(NoParams());

      result.fold(
        (error) => emit(ProfileErrorState(message: error.toString())),
        (result) => emit(ProfileLoadedState(user: result)),
      );
    } on Exception catch (e) {
      emit(ProfileErrorState(message: e.toString()));
    }
  }
}
