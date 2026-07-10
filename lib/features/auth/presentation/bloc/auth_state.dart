part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

///Auth error emit any auth error scenario
class AuthErrorState extends AuthState {
  final String msg;

  const AuthErrorState({required this.msg});
}

///Emit any kind of auth success even Social and Email password
class AuthSuccessState extends AuthState {}

///For handle social login toaster purpose only later can use AuthSuccessState
class OnSocialLoginState extends AuthState {
  final String msg;

  const OnSocialLoginState({required this.msg});
  @override
  List<Object> get props => [msg];
}

///For handle social login loading states and indication only for now only
class OnSocialLoadingState extends AuthState {
  final LoginMethods type;

  const OnSocialLoadingState({required this.type});
  @override
  List<Object> get props => [type];
}
