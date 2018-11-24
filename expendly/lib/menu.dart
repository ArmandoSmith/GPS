import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';

class MenuScreen extends StatefulWidget {

  static const String routeName = "/menu";

  @override
  State createState() => new MenuScreenState();
}

class MenuScreenState extends State<MenuScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return new IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }
            );//leading: IconButton
          }
        ),
        /*actions: <Widget>[

        ],//Actions*/
      ),//AppBar
      drawer: MyDrawer(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo.png',
            fit: BoxFit.cover,
          ),//Image
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}//MenuScreen