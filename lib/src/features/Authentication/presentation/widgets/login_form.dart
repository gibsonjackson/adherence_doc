import 'package:adherence_doc/src/features/Authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/widgets/fade_anim.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _loginForm(context, state);
        },
      ),
    );
  }

  Widget _loginForm(BuildContext context, state) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            primaryColor,
            primaryDarkColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      1.4,
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              // color: Color.fromRGBO(225, 95, 27, .3),
                              color: primaryColorLiteTrans,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: TextField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 50),
                  Container(
                    child: state is LoginLoading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: LinearProgressIndicator(
                              backgroundColor: transparent,
                            ),
                          )
                        : null,
                  ),
                  FadeAnimation(
                    1.5,
                    InkWell(
                      onTap: () => state is LoginLoading
                          ? null
                          : _onLoginButtonPressed(),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.6,
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  //TODO incase we need signup
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // FadeAnimation(
                  //   1.7,
                  //   Text(
                  //     "New Here? Get started",
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  // FadeAnimation(
                  //     1.7,
                  //     Text(
                  //       "Continue with social media",
                  //       style: TextStyle(color: Colors.grey),
                  //     )),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Row(
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: FadeAnimation(
                  //           1.8,
                  //           Container(
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(50),
                  //                 color: Colors.blue),
                  //             child: Center(
                  //               child: Text(
                  //                 "Facebook",
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           )),
                  //     ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //     Expanded(
                  //       child: FadeAnimation(
                  //           1.9,
                  //           Container(
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(50),
                  //                 color: Colors.black),
                  //             child: Center(
                  //               child: Text(
                  //                 "Github",
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           )),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
