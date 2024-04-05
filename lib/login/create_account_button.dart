import 'package:flutter/material.dart';
import 'package:com.lubumi.sellers/users_repo.dart';
import 'package:com.lubumi.sellers/register/register.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepo userRepo;

  CreateAccountButton({Key key, @required UserRepo userRepo})
      : assert(userRepo != null),
        userRepo = userRepo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle:FontStyle.italic),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepo: userRepo);
          }),
        );
      },
    );
  }
}