abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  SignUpEvent(
    this.email,
    this.password,
  );
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(
    this.email,
    this.password,
  );
}

class OTPEvent extends AuthEvent {
  final String otp;
  final String email;

  OTPEvent(this.otp, this.email);
}

class CheckAuth extends AuthEvent {}
