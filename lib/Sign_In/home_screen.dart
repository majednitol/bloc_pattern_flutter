import 'package:bloc_pattern/Sign_In/bloc/signin_bloc.dart';
import 'package:bloc_pattern/Sign_In/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: const LoginScreen(),
                            )));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 350,
                color: Colors.deepPurple,
                child: const Text(
                  "Login with Email",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
