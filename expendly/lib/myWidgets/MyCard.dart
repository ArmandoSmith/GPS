import 'package:flutter/material.dart';


class MyCard extends StatefulWidget {
  @override
  State createState() => new MyCardState();
}//MyCard

class MyCardState extends State<MyCard> {

  ListView listaCompras(BuildContext context) {
    Card getComprasCard(String fecha, String sucursal, String producto, String precio) {
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
        ), //Column
      ); //Card
    } //getComprasCard

    List<String> Fechas = [
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
      "24/11/2018",
    ];

    List<String> Sucursales = [
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
      "ITT Tomas Aquino",
    ];

    List<String> Productos = [
      "Chetos",
      "Coca Cola",
      "Chetos",
      "Coca Cola",
      "Coca Cola",
      "Chetos",
      "Chetos",
      "Coca Cola",
      "Chetos",
      "Coca Cola",
    ];

    List<String> Precios = [
      "\$15",
      "\$12",
      "\$15",
      "\$12",
      "\$12",
      "\$15",
      "\$15",
      "\$12",
      "\$15",
      "\$12",
    ];

    List<Card> opciones = new List<Card>();

    for (var i = 0; i < 10; i++){
      opciones.add(getComprasCard(Fechas[i], Sucursales[i], Productos[i], Precios[i]));
    };

    return ListView(
      children: opciones,
    );
  }

  @override
  Widget build(BuildContext context) {
    return listaCompras(context);
  } //Widget build
}//MyCardState


/*
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
*/
