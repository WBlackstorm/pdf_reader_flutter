import 'package:flutter/material.dart';
import 'shelf_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loginField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget loginField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == 'test@kongros.com') {
          return null;
        } else {
          return 'Invalid e-mail';
        }
      },
      decoration: InputDecoration(
        labelText: 'E-mail',
        hintText: 'you@example.com',

      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == '123456') {
          return null;
        } else {
          return 'Invalid password';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Type your password',

      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return RaisedButton(
      child: Text('Enter'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShelfScreen()),
          );
        }
      },
    ); 
  }

}