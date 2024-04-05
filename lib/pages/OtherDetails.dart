import 'package:com.lubumi.sellers/register/background.dart';
import 'package:flutter/material.dart';
import 'package:stretchy_header/stretchy_header.dart';

class OtherDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StretchyHeader.singleChild(
          headerData: HeaderData(
            headerHeight: 200,
            backgroundColor: Colors.white70,
            blurColor: Colors.orangeAccent,
            header: UserAccountsDrawerHeader(
              accountName: Text("Adedotun"),
              accountEmail: Text("dotun.ogunwuyi71@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/lubumi.png'),
              ),
              margin: EdgeInsets.zero,
            ),
              overlay: Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: Colors.transparent,
                  child: InkResponse(
                    onTap: () {
                      print("I was tapped");
                    },
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Stack(
                     children: <Widget>[
                       RegBackground(),
                     ],
                    )
                  ),
                ),
              ),
            )
          ),

      ),
    );
  }
}