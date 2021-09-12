import 'dart:async';

import 'package:adherence_doc/src/features/Authentication/data/repositories/login_repo.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/blocs/auth_bloc/authentication_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({this.userRepository, this.authenticationBloc});

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        if (event.username == null ||
            event.username.isEmpty ||
            event.password == null ||
            event.password.isEmpty) {
          yield LoginFailure(error: "All Fields are neccessary!");
        } else {
          final token = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );

          authenticationBloc.add(LoggedIn(token: token));
          yield LoginInitial();
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
