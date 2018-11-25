import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';
import 'myWidgets/MyCard.dart';

class PurchasesScreen extends StatefulWidget {

  static const String routeName = "/purchases";

  @override
  State createState() => new PurchasesScreenState();
}

class PurchasesScreenState extends State<PurchasesScreen>{

  int i = 3;

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
          new Column(
            children: <Widget>[
              new MyCard(
                Fecha: "24/11/2018",
                Sucursal: "ITT Tomas Aquino",
                Producto: "Chetos",
                Precio: "\$15",
              ),//MyCard
              new MyCard(
                Fecha: "23/11/2018",
                Sucursal: "ITT Tomas Aquino",
                Producto: "Coca cola",
                Precio: "\$16",
              ),//MyCard
            ],//Column children
          ),//Column
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}//MenuScreen