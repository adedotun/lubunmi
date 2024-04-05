import 'package:com.lubumi.sellers/pages/AppHome.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';
import 'package:com.lubumi.sellers/pages/Home.dart';
import 'package:com.lubumi.sellers/pages/Splash2.dart';
import 'package:com.lubumi.sellers/login/login_screen.dart';
import 'package:com.lubumi.sellers/simple_bloc_delegate.dart';
import 'package:com.lubumi.sellers/users_repo.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepo userRepo =UserRepo();
  runApp(
    BlocProvider(
        create: (context) => AuthenticationBloc(
        userRepo: userRepo,
      )..add(AppStarted()),
      child: Lubumi(userRepo: userRepo),
    )
  );
}


class Lubumi extends StatelessWidget {
  final UserRepo _userRepo;

  Lubumi({Key key, @required UserRepo userRepo})
      : assert(userRepo != null),
        _userRepo = userRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFC6600),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context,state){
          if(state is Unauthenticated){
            return LoginScreen(userRepo: _userRepo);
          }
          if(state is Authenticated){
            return Home(name: state.displayName);
          }
          return SplashScreen();
        }
      ),
    );
  }

}
