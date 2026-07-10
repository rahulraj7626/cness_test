import 'package:equatable/equatable.dart';

///Base failure class and can extend more types of error if needed
///ex: ServerError, Timeout error and more

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}
