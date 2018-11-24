import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
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
          new ExpansionPanelList(
            List<ExpansionPanel>
          ),//ExpansionPanel
        ],//Actions*/
      ),//AppBar
      drawer: new ListTile(
        leading: new Icon(Icons.verified_user),
        title: Text('Perfil'),
        onTap: null,
      ),//ListTile
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/login.png',
            fit: BoxFit.cover,
          ),//Image
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}//MenuScreen