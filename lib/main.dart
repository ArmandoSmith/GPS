import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Maquina Expendedora",
    home: MyLogIn(),
  ));
}

class MyLogIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Image.asset(
            'imagenes/sodep.png',
            height: 240.0,
            width: 300.0,
            fit: BoxFit.scaleDown
          ),
          Row(
            children: <Widget>[
              Icon(IconData(0xe851, fontFamily: 'MaterialIcons')),

            ],
          ),
          TextField(
            decoration: InputDecoration(hintText: "Usuario"),
          ),
          Row(
            children: <Widget>[
              Icon(IconData(0xe897, fontFamily: 'MaterialIcons')),
              //TextField(),
            ],
          ),
        ],
      ),
    );
  }
}