import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCard extends StatefulWidget {
  @override
  State createState() => new MyCardState();
}//MyCard

class MyCardState extends State<MyCard> {

  Future<List> getCompras() async {
    final response = await http.get("http://expendly.000webhostapp.com/Obtener_Peticion.php");
    return json.decode(response.body);
  } //Future<List> getMaquinaProducto()

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getCompras(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData 
          ? new Compras(list: snapshot.data,)
          : new Center(
            child: new CircularProgressIndicator(),
          );//Center
      }, //builder
    );//FutureBuidler;
  } //Widget build
}//MyCardState

class Compras extends StatelessWidget {

  final List list;

  Compras({this.list});

  MyCardState mcs = new MyCardState();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null 
        ? 0 
        : list.length,
      itemBuilder: (context, i) {
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
                    "Fecha: ${list[i]['CANAL']}",
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
                      "${list[i]['CANAL']}",
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
                                "${list[i]['CANAL']}",
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
                                "${list[i]['CANAL']}",
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
        );
      },//itemBuilder
    );//ListView.builder
  }//Widget build
}