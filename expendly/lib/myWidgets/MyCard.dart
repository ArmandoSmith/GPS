import 'package:flutter/material.dart';

/*
class MyCard extends StatefulWidget {
  @override
  State createState() => new MyCardState();
}//MyCard

class MyCardState extends State<MyCard> {

  Card comprasCard(BuildContext context) {
    Column getCardData(String fecha, String sucursal, String producto,
        String precio) {
      return new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Center(
              child: new Text(
                "Fecha: $fecha",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ), //TxtStyle
              ), //Text
            ), //Center
          ), //Container
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Sucursal de compra ",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ), //TextStyle
                ), //Text
                new Text(
                  "$sucursal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ), //TextStyle
                ), //Text
              ], //Column children
            ), //Column
          ), //Container
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Producto",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ), //TextStyle
                          ), //Text
                          new Text(
                            "$producto",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ), //TextStyle
                          ), //Text
                        ], //Column children
                      ), //Column
                    ), //Container
                    new Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Precio",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ), //TextStyle
                          ), //Text
                          new Text(
                            "$precio",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ), //TextStyle
                          ), //Text
                        ], //Column children
                      ), //Column
                    ), //Container
                  ], //Row children
                ), //Row
              ], //Column children
            ), //Column
          ), //Container
        ], //Collumn children
      ); //Column
    } //getCardData


    /*var opciones = [
      getCardData("24/11/2018", "ITT Tomas Aquino", "Chetos", "\$15"),
      getCardData("24/11/2018", "ITT Tomas Aquino", "Coca Cola", "\$16"),
    ];*/

    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: getCardData("24/11/2018", "ITT Tomas Aquino", "Chetos", "\$15"),
    ); //Card
  }

  @override
  Widget build(BuildContext context) {
    return comprasCard(context);
  } //Widget build
}//MyCardState
*/


class MyCard extends StatelessWidget{

  MyCard({this.Fecha, this.Sucursal, this.Producto, this.Precio});

  final String Fecha, Sucursal, Producto, Precio;

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Center(
              child: new Text(
                "Fecha: $Fecha",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),//TxtStyle
              ),//Text
            ),//Center
          ),//Container
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Sucursal de compra ",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),//TextStyle
                ),//Text
                new Text(
                  "$Sucursal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),//TextStyle
                ),//Text
              ],//Column children
            ),//Column
          ),//Container
          new Container(
            padding: EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Producto",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),//TextStyle
                          ),//Text
                          new Text(
                            "$Producto",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),//TextStyle
                          ),//Text
                        ],//Column children
                      ),//Column
                    ),//Container
                    new Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Precio",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),//TextStyle
                          ),//Text
                          new Text(
                            "$Precio",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),//TextStyle
                          ),//Text
                        ],//Column children
                      ),//Column
                    ),//Container
                  ],//Row children
                ),//Row
              ],//Column children
            ),//Column
          ),//Container
        ],//Collumn children
      ),//Column
    );//Card
  }//Widget buil
}//MyCard
