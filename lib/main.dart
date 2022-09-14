import 'package:adherence_doc/src/common/widgets/loading.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/blocs/auth_bloc/authentication_bloc.dart';
import 'package:adherence_doc/src/features/Authentication/presentation/pages/login_page.dart';
import 'package:adherence_doc/src/utils/res/res.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/common/widgets/splashscreen.dart';
import 'src/features/Authentication/data/repositories/login_repo.dart';
import 'src/features/home/presentation/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository)..add(AppStarted());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.APP_NAME,
        theme: THEME_DATA,
        home: Crossroads(),
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

final LoginRepository userRepository = LoginRepository();

class Crossroads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (BuildContext context, AuthenticationState state) {
        if (state is AuthenticationUninitialized) {
          return SplashPage();
        }
        if (state is AuthenticationAuthenticated) {
          return HomePage(doctorEmail: state.userMail);
        }
        if (state is AuthenticationUnauthenticated) {
          return LoginPage(userRepository: userRepository);
        }

        if (state is AuthenticationLoading) {
          return LoadingIndicator();
        }
        return SplashPage();
      },
    );
  }
}
