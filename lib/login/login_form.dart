import 'package:com.lubumi.sellers/login/background.dart';
import 'package:com.lubumi.sellers/login/bloc/loginUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/users_repo.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';
import 'package:com.lubumi.sellers/login/login.dart';

class LoginForm extends StatefulWidget {
  final UserRepo _userRepo;

  LoginForm({Key key, @required UserRepo userRepo})
      : assert(userRepo != null),
        _userRepo = userRepo,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  LoginBloc _loginBloc;

  UserRepo get _userRepo => widget._userRepo;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Login Failed, internet connection interrupted!'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.black,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
                backgroundColor: Color(0xFFFC6600),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                Background(),
                SingleChildScrollView(
                  child: Column(

                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
                      ),
                      Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 40, bottom: 30),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width - 40,
                                      child: Column(
                                        children: <Widget>[
                                          Material(
                                            color: Colors.white,

                                            child: Padding(
                                              padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                                              child: TextFormField(
                                                controller: _emailController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "sell@lubumi.now",
                                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                                ),
                                                autocorrect: false,
                                                autovalidate: true,
                                                validator: (_) {
                                                    return !state.isEmailValid ? 'Invalid Email' : null;
                                                            },
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0)
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: 15.0),
                                          ),
                                          Material(
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "password",
                                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
                                                ),
                                                obscureText: true,
                                                autocorrect: false,
                                                autovalidate: false,
                                                validator: (_){
                                                  return !state.isPasswordValid ? 'Invalid Password' : null;
                                                },
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusDirectional.circular(20.0)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 50),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 40),
                                                child: Text(
                                                  '',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(color: Color(0xFFA0A0A0),
                                                      fontSize: 12),
                                                ),
                                              )),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: ShapeDecoration(
                                              shape: CircleBorder(),
                                              gradient: LinearGradient(
                                                  colors: signUpGradients,
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight),
                                            ),
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_forward,
                                                size: 40,
                                                color: Colors.white),
                                              onPressed: _onFormSubmitted,
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40),
                          ),
                          GoogleLoginButton(),
                          FacebookLoginButton(),
                          CreateAccountButton(userRepo: _userRepo),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
//          return Padding(
//            padding: EdgeInsets.all(20.0),
//            child: Form(
//              child: ListView(
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 20),
//                    child: Image.asset('assets/lubumi.png', height: 150, width: 100,),
//                  ),
//                  TextFormField(
//                    controller: _emailController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.email),
//                      labelText: 'Email',
//                    ),
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return !state.isEmailValid ? 'Invalid Email' : null;
//                    },
//                  ),
//                  TextFormField(
//                    controller: _passwordController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.lock),
//                      labelText: 'Password',
//                    ),
//                    obscureText: true,
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return !state.isPasswordValid ? 'Invalid Password' : null;
//                    },
//                  ),
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 20),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: <Widget>[
//                        LoginButton(
//                          onPressed: isLoginButtonEnabled(state)
//                              ? _onFormSubmitted
//                              : null,
//                        ),
//                        GoogleLoginButton(),
//                        FacebookLoginButton(),
//                        CreateAccountButton(userRepo: _userRepo),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          );
//
//        return Scaffold(
//          resizeToAvoidBottomPadding: true,
//          backgroundColor: Colors.black45,
//          body: Stack(
//            children: <Widget>[
//              Background(),
//              LoginUI(),
//            ],
//          ),
//        );

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];

//class InputWidget extends StatelessWidget {
//  final double topRight;
//  final double bottomRight;
//  InputWidget(this.topRight, this.bottomRight);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.only(right: 40, bottom: 30),
//        child: Container(
//          width: MediaQuery.of(context).size.width - 40,
//          child: Material(
//            elevation: 10,
//            color: Colors.white,
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.only(
//                    bottomRight: Radius.circular(bottomRight),
//                    topRight: Radius.circular(topRight))),
//            child: Column(
//              children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
//                  child: TextField(
//                    decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: "sell@lubumi.now",
//                        hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
//                    ),
//
//                  ),
//                ),
//                Divider(
//                  color: Colors.black,
//                  thickness: 8,
//                ),
//                Padding(
//                  padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
//                  child: TextField(
//                    decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: "password",
//                        hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)
//                    ),
//                    obscureText: true,
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//    );
//  }
//}