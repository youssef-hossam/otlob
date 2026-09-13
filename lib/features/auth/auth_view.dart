import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob/core/utils/back_button.dart';
import 'package:otlob/features/auth/cubit/sign_in_cubit.dart';
import 'package:otlob/features/auth/sign_in.dart';
import 'package:otlob/features/auth/sign_up.dart';

class AuthView extends StatefulWidget {
  AuthView({super.key});
  @override
  State<AuthView> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<AuthView> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Stack(
          children: [
            Container(
                height: 442,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/on_boarding_two.png'),
                ))),
            Positioned(
              top: 20,
              left: 20,
              child: backButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 8,
                            width: 70,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLogin = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: !isLogin
                                            ? const Color(0xFFE50046)
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    if (!isLogin)
                                      Container(
                                        width: 65,
                                        height: 2,
                                        color: const Color(0xFFE50046),
                                      ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLogin = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isLogin
                                            ? const Color(0xFFE50046)
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    if (isLogin)
                                      Container(
                                        width: 30,
                                        height: 2,
                                        color: const Color(0xFFE50046),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          isLogin
                              ? BlocProvider<SignInCubit>(
                                  create: (context) => SignInCubit(),
                                  child: SignInForm(),
                                )
                              : SignUpForm(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
      ]),
    );
  }
}
