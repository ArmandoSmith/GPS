import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuScreen extends StatefulWidget {
  static const String routeName = "/menu";

  @override
  State createState() => new MenuScreenState();
}//MenuScreen

class MenuScreenState extends State<MenuScreen> {

  String tituloMaquina;
  List dataMaquina;

  Future<List> getMaquinaProducto() async {
    final response = await http.get("http://expendly.000webhostapp.com/PANTALLAPRINCIPAL_CONSULTA.php?ID_SUCURSAL=1");
    return json.decode(response.body);
  } //Future<String> getMaquinaProducto()
  
  @override
  Widget build(BuildContext context) {  
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(builder: (BuildContext context) {
          return new IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }); //leading: IconButton
        }),
        title: new Text("Sucursal"),
        /*actions: <Widget>[

        ],//Actions*/
      ), //AppBar
      drawer: MyDrawer(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo_drawer_header.png',
            fit: BoxFit.cover,
          ), //Image
          new FutureBuilder(
            future: getMaquinaProducto(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData 
                ? new MaquinaProductos(list: snapshot.data,)
                : new Center(
                  child: new CircularProgressIndicator(),
                );//Center
            }, //builder
          ),//FutureBuidler
        ],//Stack children
      ),//Stack
    ); //Scaffold
  } //Widget build
}//MenuScreenState


class MaquinaProductos extends StatelessWidget {

  final List list;

  MaquinaProductos({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null
        ? 0
        : list.length,
      itemBuilder: (context, i){
        return new Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Center(
                child: new Text(
                  list[i]['TITULO'],
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ), 
                  ),
              ),//Center
              new Container(
                width: MediaQuery.of(context).size.width,
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        children: <Widget>[
                          new Text(
                            list[i]['NOMBRE_PRODUCTO'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              ), 
                          ),
                          new Text(
                            list[i]['PRECIO'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              ),
                          ),
                        ],//Column children
                      ),//Column
                    ),//Container
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                //Regresar la alerta
                                return AlertDialog(
                                  title: new Text("Aviso"),
                                  content: new Container(
                                    height: MediaQuery.of(context).size.height * 0.1,
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text("Seguro que quiere comprar:"),
                                        new Text(list[i]['NOMBRE_PRODUCTO']),
                                        new Text(list[i]['PRECIO']),
                                      ],//Column children
                                    ),//Column,
                                  ), 
                                  actions: <Widget>[
                                    //Botones de la alerta
                                    new FlatButton(
                                      child: new Text("OK"),
                                      color: Colors.greenAccent,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    new FlatButton(
                                      child: new Text("NO"),
                                      color: Colors.redAccent,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ], 
                    ),
                  ],//Row children
                ),//Row
              ),//Container
            ],//Column children
          ),//Column
        );//Container
      }//itemBuilder
    );//ListView.builder
  }
}