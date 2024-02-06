import 'package:bloc_pattern/Sign_In/bloc/signin_bloc.dart';
import 'package:bloc_pattern/Sign_In/bloc/signin_event.dart';
import 'package:bloc_pattern/Sign_In/bloc/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emilEditingControler = TextEditingController();
    TextEditingController passwordEditingControler = TextEditingController();
    String errorMsg = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  errorMsg = state.errorMessage;
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emilEditingControler,
              onChanged: (val) => {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emilEditingControler.text, passwordEditingControler.text))
              },
              decoration:
                  const InputDecoration(hintText: "Enter email address"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (val) => {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emilEditingControler.text, passwordEditingControler.text))
              },
              controller: passwordEditingControler,
              obscureText: true,
              decoration:
                  const InputDecoration(hintText: "Enter password address"),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GestureDetector(
                  onTap: () => {
                    if (errorMsg != "")
                      {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmitButtonEvent(emilEditingControler.text,
                                passwordEditingControler.text))
                      }
                  },
                  child: Container(
                    height: 45,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: (state is SignInValidationState)
                            ? Colors.deepPurple
                            : Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
