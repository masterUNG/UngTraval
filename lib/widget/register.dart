import 'package:flutter/material.dart';
import 'package:ungtravel/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method

  Widget nameForm() {
    Color color = Colors.purple;
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        style: TextStyle(color: color),
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          helperText: 'Type Your Name In Blank',
          helperStyle: TextStyle(color: color),
          labelText: 'Display Name :',
          labelStyle: TextStyle(color: color),
          icon: Icon(
            Icons.account_circle,
            color: color,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    Color color = Colors.brown;
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        style: TextStyle(color: color),
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          helperText: 'Type Your Email In Blank',
          helperStyle: TextStyle(color: color),
          labelText: 'Email :',
          labelStyle: TextStyle(color: color),
          icon: Icon(
            Icons.email,
            color: color,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget passwordForm() {
    Color color = Colors.green.shade800;
    return Container(
      margin: EdgeInsets.only(left: 30.0, right: 30.0),
      child: TextField(
        style: TextStyle(color: color),
        decoration: InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          helperText: 'Type Your Password In Blank',
          helperStyle: TextStyle(color: color),
          labelText: 'Password :',
          labelStyle: TextStyle(color: color),
          icon: Icon(
            Icons.lock,
            color: color,
            size: 36.0,
          ),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return OutlineButton.icon(
      icon: Icon(Icons.add_a_photo),
      label: Text('Camera'),
      onPressed: () {},
    );
  }

  Widget galleryButton() {
    return OutlineButton.icon(
      icon: Icon(Icons.add_photo_alternate),
      label: Text('Gallery'),
      onPressed: () {},
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        cameraButton(),
        galleryButton(),
      ],
    );
  }

  Widget showAvatar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Image.asset('images/avatar.png'),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: MyStyle().barColor,
        title: Text('Register'),
      ),
      body: ListView(
        children: <Widget>[
          showAvatar(),
          showButton(),
          nameForm(),
          emailForm(),
          passwordForm(),
        ],
      ),
    );
  }
}
