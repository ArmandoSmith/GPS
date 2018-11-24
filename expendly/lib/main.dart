import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';
import 'purchases.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Maquina Expendedora",
      home: new LoginScreen(),
      routes: <String, WidgetBuilder>{
        ProfileScreen.routeName: (BuildContext context) => new ProfileScreen(),
        PurchasesScreen.routeName: (BuildContext context) => new PurchasesScreen(),
        LoginScreen.routeName: (BuildContext context) => new LoginScreen(),
      },
    );
  }//Widget build
}//MyApp