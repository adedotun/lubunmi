import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';

class Search extends StatelessWidget{
  Search({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFC6600),
        title: Text('Search'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text('Search'),
          )
        ],
      ),
    );
  }

}