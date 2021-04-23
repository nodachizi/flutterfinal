import 'package:fluttermk2/screens/auth/widgets/update.dart';
import 'package:fluttermk2/screens/auth/widgets/delete.dart';
import 'package:fluttermk2/screens/auth/widgets/create.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'auth/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Signed in'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButtonSignOut(context),
          buildButtonCreateData(context),
          buildButtonUpdateData(context),
          buildButtonRemove(context),
        ],
      ),
    );
  }

  Container buildButtonSignOut(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Sign Out",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            context.signOut();
            Navigator.of(context).push(AuthScreen.route);
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

  Container buildButtonCreateData(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Create Data",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => creat()));
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

  Container buildButtonUpdateData(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Update Data",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => update()));
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

  Container buildButtonRemove(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(width: 200, height: 40),
        child: InkWell(
          child: Text("Delete Data",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black)),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => delete()));
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
