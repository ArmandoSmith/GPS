import 'package:flutter/material.dart';
import 'package:expendly/menu.dart';
import 'package:expendly/profile.dart';
import 'package:expendly/purchases.dart';
import 'package:expendly/login.dart';

class MyDrawer extends StatefulWidget {
  @override
  State createState() => new MyDrawerState();
}//MyDrawer

class MyDrawerState extends State<MyDrawer>{

  Drawer menuDrawer(BuildContext context){

    var headerChild = new DrawerHeader(
      child: new Image.asset('imagenes/logo.png'),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('imagenes/fondo_drawer_header.png'),
          fit: BoxFit.fill,
        ),//DecorationImage
      ),//BoxDecoration
    );//DrawerHeader

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
      getNavItem(Icons.home, "Principal", MenuScreen.routeName),
      getNavItem(Icons.account_circle, "Perfil", ProfileScreen.routeName),
      getNavItem(Icons.attach_money, "Compras", PurchasesScreen.routeName),
      getNavItem(Icons.exit_to_app, "Cerrar Sesión", LoginScreen.routeName)
    ];

    ListView opcionesDrawer = new ListView(children: opciones);

    return new Drawer(
      child: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('imagenes/fondo_drawer_listtile.png'),
            fit: BoxFit.fill,
          ),//DecorationImage
        ),//BoxDecoration
        child: opcionesDrawer,
      ),//Container
    );
  }//menuDrawer

  @override
  Widget build(BuildContext context) {
    return menuDrawer(context);
  }//Widget build
}//MyDrawerState