part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

///For email passsword login
class OnLoginEvent extends AuthEvent {
  final LoginEntity cred;
  const OnLoginEvent({required this.cred});
}

///For OnSocialLogin login
class OnSocialLoginEvent extends AuthEvent {
  final LoginMethods type;

  const OnSocialLoginEvent({required this.type});
}
