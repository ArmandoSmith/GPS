import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';

class ProfileScreen extends StatefulWidget {

  static const String routeName = "/profile";

  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{

  String Usuario, Correo, Tarjeta;
  double ScreenHeight;

  @override
  Widget build(BuildContext context) {
    ScreenHeight = MediaQuery.of(context).size.height;
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
      drawer: MyDrawer(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo.png',
            fit: BoxFit.cover,
          ),//Image
          new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Center(
                    child: new Image.asset(
                      'imagenes/usuario_default.png',
                    ),//Image,
                  ),//Center
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('imagenes/fondo_profile_user.png'),
                      fit: BoxFit.fill,
                    ),//DecorationImage
                  ),//BoxDecoration
                  height: ScreenHeight * 0.35,
                ),//Container
                new Container(
                  padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
                  child: new Text.rich(
                    TextSpan(
                      text: 'Nombre:\n',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Mostrar nombre',//agregar $Usuario
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