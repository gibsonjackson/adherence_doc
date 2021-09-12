import 'dart:async';
import 'package:adherence_doc/src/features/Authentication/data/auth_persist_manager.dart';
import 'package:adherence_doc/src/features/Authentication/data/models/user.dart';
import 'package:adherence_doc/src/features/Authentication/data/repositories/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginRepository userRepository;

  AuthenticationBloc(this.userRepository);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    AuthPersistManager manager = AuthPersistManager();
    if (event is AppStarted) {
      final String userMail = await manager.getUserMail();
      // User user = User(id: 1, name: "name", points: 2);
      // yield AuthenticationAuthenticated(user);

      if (userMail != null && userMail != "") {
        //FIXME
        yield AuthenticationAuthenticated(userMail);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await manager.persistUserName(event.user.email);
      yield AuthenticationAuthenticated(event.user.email);
    }

    // if (event is NamingComplete) {
    //   yield AuthenticationLoading();
    //   await manager.persistUserName(event.user);
    //   await manager.persistAssName(event.ass);
    //   // USER = event.user;
    //   // ASSITANT_NAME = event.ass;
    //   // User user = DummyData().user;
    //   // user.name = USER;3
    //   // yield AuthenticationAuthenticated(user);
    // }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await manager.clearUser();
      yield AuthenticationUnauthenticated();
    }
  }
}
