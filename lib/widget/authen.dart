import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_style.dart';
import 'package:ungtravel/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method
  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: MyStyle().textColor),
      ),
      onPressed: () {
        print('You Click Sign Up');

        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext){return Register();});
        Navigator.of(context).push(materialPageRoute);

      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 5.0,
        ),
        signUpButton(),
      ],
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          prefixIcon: Icon(
            Icons.email,
            color: MyStyle().textColor,
          ),
          hintText: 'User :',
          hintStyle: TextStyle(color: MyStyle().textColor),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          prefixIcon: Icon(
            Icons.lock,
            color: MyStyle().textColor,
          ),
          hintText: 'Password :',
          hintStyle: TextStyle(color: MyStyle().textColor),
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Traval',
      style: MyStyle().h1Text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(radius: 1.0,
            colors: <Color>[Colors.white, MyStyle().mainColor],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passwordForm(),
              SizedBox(
                height: 10.0,
              ),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
