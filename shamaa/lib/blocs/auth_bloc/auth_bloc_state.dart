abstract class AuthStates {}

class InitialState extends AuthStates {}

class SuccessSignUpState extends AuthStates {}

class SuccessLoginState extends AuthStates {}

class SuccessOtpState extends AuthStates {}

class LoadingSignUpState extends AuthStates {}

class LoadingLoginState extends AuthStates {}

class LoadingSignInState extends AuthStates {}

class ErrorLoginState extends AuthStates {
  final String message;

  ErrorLoginState(this.message);
}

class LoadingOtpState extends AuthStates {}

class SuccessLoginCheck extends AuthStates {}

class ErrorLoginCheck extends AuthStates {}

class ErrorOtpState extends AuthStates {
  final String message;

  ErrorOtpState(this.message);
}

class ErrorSignUpState extends AuthStates {
  final String message;

  ErrorSignUpState(this.message);
}
