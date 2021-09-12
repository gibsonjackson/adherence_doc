part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token});

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class NamingComplete extends AuthenticationEvent {
  final String user;
  final String ass;

  NamingComplete(this.user, this.ass);
  @override
  String toString() => 'NamingComplete';
}
