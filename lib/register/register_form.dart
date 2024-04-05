import 'package:com.lubumi.sellers/pages/OtherDetails.dart';
import 'package:com.lubumi.sellers/register/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';
import 'package:com.lubumi.sellers/register/register.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                  backgroundColor: Color(0xFFFC6600),
              ),
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
            children: <Widget>[
              RegBackground(),

              Container(
                padding: EdgeInsets.only(top: 80,left: 20,right: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Kindly fill the details to create an account",
                          style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 15.0),),
                    Material(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40, right: 20, top: 5, bottom: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "What's your Firstname?",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 17)
                          ),
                          autocorrect: false,
                          autovalidate: true,
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
                              hintText: "Phone Number?",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 17)
                          ),
                          autocorrect: false,
                          autovalidate: true,
                          keyboardType: TextInputType.number,
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "What's your valid email?",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 17)
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
                              hintText: "Create password",
                              hintStyle: TextStyle(color: Colors.black, fontSize: 17)
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                    ),
                    RegisterButton(
                      onPressed: ()=> {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return OtherDetails();
                        }))
                      },
                    ),
                  ],
                ),
              )
            ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}