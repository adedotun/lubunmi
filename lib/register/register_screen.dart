import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/users_repo.dart';
import 'package:com.lubumi.sellers/register/register.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepo _userRepo;

  RegisterScreen({Key key, @required UserRepo userRepo})
      : assert(userRepo != null),
        _userRepo = userRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(userRepo: _userRepo),
          child: RegisterForm(),
        ),
      ),
    );
  }
}