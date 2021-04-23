import 'dart:math';

import 'package:fluttermk2/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermk2/screens/home.dart';

class creat extends StatefulWidget {
  final String status;
  const creat({Key key, this.status}) : super(key: key);

  @override
  _creatState createState() => _creatState();
}

class _creatState extends State<creat> {
  String iddoc;
  String name;
  String last;
  String nickname;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.black26),
                  onChanged: (Name) => name = Name,
                  obscureText: false,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue[200], width: 2.0),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[200], width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black26)),
                ),
                Text(""),
                TextField(
                  style: TextStyle(color: Colors.black26),
                  onChanged: (Last) => last = Last,
                  obscureText: false,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue[200], width: 2.0),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[200], width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'LastName',
                      labelStyle: TextStyle(color: Colors.black26)),
                ),
                Text(""),
                TextField(
                  style: TextStyle(color: Colors.black26),
                  onChanged: (Nick) => nickname = Nick,
                  obscureText: false,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue[200], width: 2.0),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[200], width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Nickname',
                      labelStyle: TextStyle(color: Colors.black26)),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtoncreateData(),
              buildButtonSignOut(),
              buildButtonBack(),
            ],
          )
        ],
      ),
    ));
  }

  void onClickSignOut() async {
    await FirebaseAuth.instance.signOut();
    EasyLoading.showInfo("Sign-Out Complete");
  }

  Container buildButtonSignOut() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Sign Out",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black26)),
          onTap: () {
            onClickSignOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#6974CD"), HexColor("#2265A1")],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12));
  }

  Container buildButtoncreateData() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("create",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black26)),
          onTap: () {
            createData();
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#67E4BD"), HexColor("#3E995C")],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12));
  }

  Container buildButtonBack() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Back",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black26)),
          onTap: () {
            back();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#749FF2"), HexColor("#1863F3")],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12));
  }

  void back() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void createData() {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    EasyLoading.showSuccess("Created");
    users
        .add({'Name': '$name', 'Lastname': '$last', 'Nickname': '$nickname'})
        .then((value) => print('success'))
        .catchError((e) => print(e));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
