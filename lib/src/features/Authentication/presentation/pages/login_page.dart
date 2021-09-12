// import 'package:adherence/src/features/auth/presentation/widgets/logn_form_jwiw.dart';
import 'package:adherence_doc/src/features/Authentication/data/repositories/login_repo.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/blocs/auth_bloc/authentication_bloc.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final LoginRepository userRepository;

  final AuthenticationBloc authenticationBloc;

  const LoginPage({Key key, this.userRepository, this.authenticationBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}
