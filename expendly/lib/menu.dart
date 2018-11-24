import 'package:flutter/material.dart';
import 'profile.dart';
import 'purchases.dart';
import 'login.dart';

class MenuScreen extends StatefulWidget {

  static const String routeName = "/menu";

  @override
  State createState() => new MenuScreenState();
}

class MenuScreenState extends State<MenuScreen>{

  Drawer menuDrawer(BuildContext context){

    var headerChild = new DrawerHeader(child: new Image.asset('imagenes/logo.png'));

    ListTile getNavItem(var icon, String titulo, String ruta){
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(titulo),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(ruta);
          });
        },//onTap
      );
    }//ListTile

    var opciones = [
      headerChild,
      getNavItem(Icons.inbox, "Principal", MenuScreen.routeName),
      getNavItem(Icons.account_circle, "Perfil", ProfileScreen.routeName),
      getNavItem(Icons.attach_money, "Compras", PurchasesScreen.routeName),
      getNavItem(Icons.exit_to_app, "Cerrar Sesión", LoginScreen.routeName)
    ];

    ListView listView = new ListView(children: opciones);

    return new Drawer(
      child: listView,
    );
  }//Drawer

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
      drawer: menuDrawer(context),
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