import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/users_repo.dart';
import 'package:com.lubumi.sellers/login/login.dart';

class LoginScreen extends StatelessWidget {
  final UserRepo _userRepo;

  LoginScreen({Key key, @required UserRepo userRepo})
      : assert(userRepo != null),
        _userRepo = userRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.black45,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepo: _userRepo),
        child: LoginForm(userRepo: _userRepo),
      ),
    );
  }
}