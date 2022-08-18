part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInSuccess extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInFail extends SignInState {
  final String error;

  SignInFail(this.error);

  @override
  List<Object?> get props => [];
}
