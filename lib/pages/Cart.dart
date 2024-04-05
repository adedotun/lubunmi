import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.lubumi.sellers/authentication_bloc/bloc.dart';

class Cart extends StatelessWidget{
  Cart({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFFC6600),
        title: Text('Cart'),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return ListTile(
          title: Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      })
    );
  }

}