import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_guys_run/repository/authentication_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository authenticationRepository;
  SignInCubit(this.authenticationRepository) : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    try {
      authenticationRepository.signIn(email: email, password: password);
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInFail(e.toString()));
    }
  }
}
