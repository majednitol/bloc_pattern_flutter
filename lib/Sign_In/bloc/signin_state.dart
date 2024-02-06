abstract class SignInState {}

class SignInValidationState extends SignInState {}

class SignInInvaildState extends SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage);
}
