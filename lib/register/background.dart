import 'package:flutter/material.dart';

class RegBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/shopping.jpeg'),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/lubumi.png'),
                height: 70.0,
                width: 90.0,
              )
            ],
          ),
        ],
      ),
    );
  }

}