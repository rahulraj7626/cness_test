import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/features/auth/domain/entities/login_entity.dart';
import 'package:cness_test/features/auth/domain/enums/auth_enums.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<OnLoginEvent>(onLoginEvent);
    on<OnSocialLoginEvent>(onSocialLoginEvent);
  }

  /// Implimention logic OnLoginEvent
  Future<void> onLoginEvent(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(Duration(seconds: 1));
    if (event.cred.email.toLowerCase() == "user@email.com" &&
        event.cred.password.toLowerCase() == "user@123") {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(msg: AppString.loginValid));
    }
  }

  /// Implimention logic OnSocialLoginEvent
  Future<void> onSocialLoginEvent(
    OnSocialLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(OnSocialLoadingState(type: event.type));
    await Future.delayed(Duration(seconds: 2));
    final msg = event.type == LoginMethods.facebook
        ? AppString.facebook
        : AppString.google;
    emit(OnSocialLoginState(msg: msg));
  }
}
