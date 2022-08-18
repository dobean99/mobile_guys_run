import 'package:bloc/bloc.dart';
import 'package:email_auth/email_auth.dart';
import 'package:equatable/equatable.dart';

part 'find_state.dart';

class FindCubit extends Cubit<FindState> {
  FindCubit() : super(FindInitial());
  late String email;
  late EmailAuth emailAuth;
  void sendOTP(String email) async {
    try{
      this.email = email;
      this.emailAuth =  EmailAuth(sessionName: "Test session");
      var res = await emailAuth.sendOtp(recipientMail: email);
      if (res) {
        emit(FindSubmit());
      }
    } catch (e) {
      emit(FindError("Can't find email"));
    }
  }

  void verifyOTP(String otp) async {
    try{
      var res = emailAuth.validateOtp(
         recipientMail: email,
        userOtp: otp);
      if (res) {
        emit(FindCodeSubmit());
      }
    } catch (e) {
      emit(FindError("Can't verified email"));
    }
  }
}