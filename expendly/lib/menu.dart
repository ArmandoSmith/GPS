import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
            'imagenes/fondo_drawer_header.png',
            fit: BoxFit.cover,
          ),//Image
          new Column(
            children: <Widget>[
              new Image.asset(
                'imagenes/banda.png',
                fit: BoxFit.cover,
              ),
              new CarouselSlider(
                items: [1,2,3].map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0),
                        child: new Image.asset(
                          'imagenes/logo.png',
                        ),//Image.asset
                      );//Container
                    },//builder
                  );//Builder
                }).toList(),
                height: 200.0,
                autoPlay: true
              ),//CarouselSlider
              new Image.asset(
                'imagenes/banda.png',
                fit: BoxFit.cover,
              ),
            ],//Column children
          ),//Column
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build

  Future<List> getData() async {
    final response = await http.get("http://REEMPLAZAR URL!");
    return json.decode(response.body);

  }//Future<List> getData()
}//MenuScreen