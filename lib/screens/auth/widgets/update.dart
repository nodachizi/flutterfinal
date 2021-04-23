import 'dart:math';
import 'package:fluttermk2/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermk2/screens/splash.dart';
import 'package:fluttermk2/screens/splash.dart';
//import 'signin.dart';

class update extends StatefulWidget {
  final String status;
  const update({Key key, this.status}) : super(key: key);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {
  String iddoc;
  String name;
  String last;
  String nick;
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
                  style: TextStyle(color: Colors.black45),
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
                      labelStyle: TextStyle(color: Colors.black45)),
                ),
                Text(""),
                TextField(
                  style: TextStyle(color: Colors.black45),
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
                      labelStyle: TextStyle(color: Colors.black45)),
                ),
                Text(""),
                TextField(
                  style: TextStyle(color: Colors.black45),
                  onChanged: (Nick) => nick = Nick,
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
                      labelStyle: TextStyle(color: Colors.black45)),
                ),
                Text(""),
                TextField(
                  style: TextStyle(color: Colors.black45),
                  onChanged: (ID) => iddoc = ID,
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
                      labelText: 'ID',
                      labelStyle: TextStyle(color: Colors.black45)),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtonUpdateData(),
              buildButtonSignOut(),
              buildButtonBack(),
            ],
          )
        ],
      ),
    ));
  }

  Container buildButtonUpdateData() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Update",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            UpdateData();
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

  void UpdateData() {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    EasyLoading.showSuccess("Updated");
    users
        .doc('$iddoc')
        .update({
          'Nickname': '$nick',
          'Name': '$name',
          'Lastname': '$last',
        })
        .then((value) => print('updated!'))
        .catchError((e) => print('update error'));
  }

  Container buildButtonBack() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Back",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
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
              style: TextStyle(fontSize: 16, color: Colors.black)),
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
