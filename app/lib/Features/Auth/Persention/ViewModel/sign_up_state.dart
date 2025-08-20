class Signupstate {}

class Signupinitial extends Signupstate {}

class SignupSecuss extends Signupstate {
  final String message;

  SignupSecuss({required this.message});
}

class SignupError extends Signupstate {
  final String ERRmessage;

  SignupError({required this.ERRmessage});
}

class SignupLoading extends Signupstate {}

class SignIninitial extends Signupstate {}

class SignInSecuss extends Signupstate {}

class SignInError extends Signupstate {
  final String ERRmessage;

  SignInError({required this.ERRmessage});
}

class ResetCodeinitial extends Signupstate {}

class ResetCodeSecuss extends Signupstate {}

class ResetCodeLoading extends Signupstate {}

class ResetCodeError extends Signupstate {
  final String ERRmessage;

  ResetCodeError({required this.ERRmessage});
}

class SignInLoading extends Signupstate {}

class AcvtiveResetCodeLoading extends Signupstate {}

class AcvtiveResetCodeLSecuess extends Signupstate {}

class AcvtiveResetCodeError extends Signupstate {
  final String ERRmessage;

  AcvtiveResetCodeError({required this.ERRmessage});
}

class AcvtiveResetCodeinitial extends Signupstate {}

class ChangePassLoading extends Signupstate {}

class ChangePassLSecuess extends Signupstate {}

class ChangePassError extends Signupstate {
  final String ERRmessage;

  ChangePassError({required this.ERRmessage});
}

class ChangePassinitial extends Signupstate {}
