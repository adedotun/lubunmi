import 'package:com.lubumi.sellers/login/bloc/loginUI.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
   final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: _onPressed,
        color: Colors.orange,
        child: Text('Register', style: TextStyle(color: Colors.white,
            fontSize: 20,fontStyle: FontStyle.italic),),
      ),
    );
    //using the created button in LoginUI, title, color and visibility of arrow
  }
}