part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginEvent extends AuthEvent {
  final LoginEntity cred;
  const OnLoginEvent({required this.cred});
}

class OnSocialLoginEvent extends AuthEvent {
  final LoginMethods type;

  const OnSocialLoginEvent({required this.type});
}
