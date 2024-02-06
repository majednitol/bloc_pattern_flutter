abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmitButtonEvent extends SignInEvent {
  final String email;
  final String password;

  SignInSubmitButtonEvent(this.email, this.password);
}
