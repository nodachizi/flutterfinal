import 'dart:math';
import 'package:fluttermk2/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttermk2/screens/splash.dart';
//import 'signin.dart';

class delete extends StatefulWidget {
  final String status;
  const delete({Key key, this.status}) : super(key: key);

  @override
  _deleteState createState() => _deleteState();
}

class _deleteState extends State<delete> {
  String iddoc;
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
                  style: TextStyle(color: Colors.black54),
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
                      labelStyle: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildButtondeleteData(),
              buildButtonSignOut(),
              buildButtonBack(),
            ],
          )
        ],
      ),
    ));
  }

  Container buildButtondeleteData() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("delete",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            deleteData();
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#8DB8DE"), HexColor("#8266CD")],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(12));
  }

  void deleteData() {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    EasyLoading.showSuccess("deleted");
    users
        .doc('$iddoc')
        .delete()
        .then((value) => print('deleted!'))
        .catchError((e) => print('delete error'));
  }

  Container buildButtonBack() {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Back",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54)),
          onTap: () {
            back();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor("#749FF2"), HexColor("#5E95C7")],
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
              style: TextStyle(fontSize: 16, color: Colors.black54)),
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
