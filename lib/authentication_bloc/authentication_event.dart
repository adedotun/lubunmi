import 'package:equatable/equatable.dart';


abstract class AuthenticationEvent extends Equatable{
List<Object> get props=> [];
}
class AppStarted extends AuthenticationEvent{ }
class LoggedIn extends AuthenticationEvent{ }
class LoggedOut extends AuthenticationEvent{ }