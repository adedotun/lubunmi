import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';
import 'Home.dart';

class AppHome extends StatefulWidget {
   final Home home;
  AppHome({Key key, this.home}) : super(key: key);

  AppHomeState createState() => AppHomeState();
}
class AppHomeState extends State<AppHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: IconButton(
            icon: Image.asset('assets/lubumi.png'),
          iconSize: 70.0,
      ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(

            child: Text('Welcome back'),
          )
        ],
      ),
    );

        }

}