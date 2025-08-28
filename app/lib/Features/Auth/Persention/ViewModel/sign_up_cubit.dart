import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Auth/data/Model/signin_model.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';

class Signupcubit extends Cubit<Signupstate> {
  Signupcubit(this.authRepo) : super(Signupinitial());

  TextEditingController signUpName = TextEditingController();

  //Sign up p
  TextEditingController feildsCOdeController = TextEditingController();

  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();
  LoginResponse? loginResponse;
  Signupmodel? signupmodel;
  String? user;
  final AuthRepo authRepo;
  signup() async {
    Signupmodel signupmodel;

    emit(SignupLoading());
    final response = await authRepo.signUp(
      email: signUpEmail.text,
      phone: signUpPhoneNumber.text,
      password: signUpPassword.text,
      name: signUpName.text,
      confrimPassword: confirmPassword.text,
    );
    response.fold(
      (errMessage) => emit(SignupError(ERRmessage: errMessage)),
      (signiNmodel) => emit(SignupSecuss(message: signiNmodel.message)),
    );
  }

  svaeemil() {
    user = signUpEmail.text;
  }

  signin() async {
    emit(SignInLoading());

    final response = await authRepo.signIn(
      password: signUpPassword.text,
      email: signUpEmail.text,
    );
    response.fold(
      (errMessage) => emit(SignInError(ERRmessage: errMessage)),
      (signiNmodel) => emit(SignInSecuss()),
    );
  }

  resetcode({email}) async {
    emit(ResetCodeLoading());
    final response = await authRepo.resetCode(email: email);
    response.fold(
      (errMessage) => (emit(ResetCodeError(ERRmessage: errMessage))),
      (resetCode) => emit(ResetCodeSecuss()),
    );
  }

  activeCode({email1}) async {
    emit(AcvtiveResetCodeLoading());
    final response = await authRepo.enterCode(
      email: email1,
      code: feildsCOdeController.text,
    );
    response.fold(
      (errMessage) => emit(AcvtiveResetCodeError(ERRmessage: errMessage)),
      (actvecode) => emit(AcvtiveResetCodeLSecuess()),
    );
  }

  changePassword({email}) async {
    emit(ChangePassLoading());
    final response = await authRepo.changePass(
      email: email,
      password: signUpPassword.text,
      confrimpass: confirmPassword.text,
    );
    response.fold(
      (errMessage) => emit(ChangePassError(ERRmessage: errMessage)),
      (actvecode) => emit(ChangePassLSecuess()),
    );
  }

  // Future<void> close() {
  //   signUpEmail.dispose();

  //   signUpName.dispose();
  //   signUpPassword.dispose();

  //   signUpPhoneNumber.dispose();
  //   return super.close();
  // }
}
