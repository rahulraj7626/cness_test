part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthErrorState extends AuthState {
  final String msg;

  const AuthErrorState({required this.msg});
}

class AuthSuccessState extends AuthState {}

class OnSocialLoginState extends AuthState {
  final String msg;
  final LoginMethods type;

  const OnSocialLoginState({required this.msg, required this.type});
  @override
  List<Object> get props => [msg, type];
}

class OnSocialLoadingState extends AuthState {
  final LoginMethods type;

  const OnSocialLoadingState({required this.type});
  @override
  List<Object> get props => [type];
}
