import 'package:flutter/material.dart';
import 'menu.dart';
import 'purchases.dart';
import 'login.dart';

class ProfileScreen extends StatefulWidget {

  static const String routeName = "/profile";

  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{

  String Usuario, Correo, Tarjeta;

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
        title: Text("Cuenta"),
      ),//AppBar
      drawer: menuDrawer(context),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo.png',
            fit: BoxFit.cover,
          ),//Image
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Center(
                  child: new Image.asset(
                    'imagenes/usuario_default.png',
                  ),//Image,
                ),//Center
                new Container(
                  padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                  child: new Text.rich(
                    TextSpan(
                      text: 'Usuario:\n',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Mostrar usuario',//agregar $Usuario
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal
                          ),
                        ),//TextSpan
                      ],//TextSpan children
                    ),//TextSpan
                  ),//Text.rich,
                ),//Container
                new Container(
                  padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                  child: new Text.rich(
                    TextSpan(
                      text: 'Correo:\n',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Mostrar correo',//agregar $Correo
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal
                          ),
                        ),//TextSpan
                      ],//TextSpan children
                    ),//TextSpan
                  ),//Text.rich,
                ),//Container
                new Container(
                  padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                  child: new Text.rich(
                    TextSpan(
                      text: 'Tarjeta:\n',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '****-****-****-1234',//agregar $Tarjeta
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal
                          ),
                        ),//TextSpan
                      ],//TextSpan children
                    ),//TextSpan
                  ),//Text.rich,
                ),//Container
              ],//Column children
            ),//Column,
          ),//Container
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}//MenuScreen