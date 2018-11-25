import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';
import 'myWidgets/MyCard.dart';

class PurchasesScreen extends StatefulWidget {

  static const String routeName = "/purchases";

  @override
  State createState() => new PurchasesScreenState();
}

class PurchasesScreenState extends State<PurchasesScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return new IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {Scaffold.of(context).openDrawer();}
            );//leading: IconButton
          }//builder
        ),//Builder
        title: Text("Compras"),
      ),//AppBar
      drawer: MyDrawer(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo.png',
            fit: BoxFit.cover,
          ),//Image
          new MyCard(),
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}//MenuScreen