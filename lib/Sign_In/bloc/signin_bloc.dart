import 'package:bloc_pattern/Sign_In/bloc/signin_event.dart';
import 'package:bloc_pattern/Sign_In/bloc/signin_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) => {
          if (EmailValidator.validate(event.emailValue) == false)
            {emit(SignInErrorState("Please enter a valid email"))}
          else if (event.passwordValue.length < 8)
            {emit(SignInErrorState("Please enter a valid password"))}
          else
            {emit(SignInValidationState())}
        });
    on<SignInSubmitButtonEvent>((event, emit) => emit(SignInLoadingState()));
  }
}
