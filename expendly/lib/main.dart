import 'package:flutter/material.dart';
import 'login.dart';
import 'menu.dart';
import 'profile.dart';
import 'purchases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Maquina Expendedora",
      home: new LoginScreen(),
      routes: <String, WidgetBuilder>{
        MenuScreen.routeName: (BuildContext context) => new MenuScreen(),
        ProfileScreen.routeName: (BuildContext context) => new ProfileScreen(),
        PurchasesScreen.routeName: (BuildContext context) => new PurchasesScreen(),
        LoginScreen.routeName: (BuildContext context) => new LoginScreen(),
      },
      
    );
  }//Widget build
}//MyApp