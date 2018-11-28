import 'package:flutter/material.dart';
import 'myWidgets/MyDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {

  static const String routeName = "/profile";

  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>{

  String Nombre, Correo, Tarjeta, id_cte = "cdWQxG8HRUbbcDZzpn44NO8szai2";
  double ScreenHeight;

  var _isLoading = false;

  List dataUsuario;

  Future<String> getUsuario() async {
    var response = await http.get("http://expendly.000webhostapp.com/PANTALLAPRINCIPAL_CONSULTA_CLIENTETARJETA.php?ID_CLIENTE=$id_cte");

    setState(() {

      dataUsuario = json.decode(response.body);

      if (dataUsuario != null) {
        var _isLoading = true;
        Nombre = dataUsuario[0]['NOMBRE'];
        Correo = dataUsuario[0]['CORREO_E'];
        Tarjeta = dataUsuario[0]['ID_TARJETA'];
      }
    });
    
    print(dataUsuario);
  } //Future<String> getUsuario

  @override
  void initState() {
    super.initState();
    setState(() {
      getUsuario();
    });
  }

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
                          text: '$Nombre',//agregar $Nombre
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
                          text: '$Correo',//agregar $Correo
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
                          text: '$Tarjeta',//agregar $Tarjeta
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
            ),//Column
          ),//Container
        ],//Stack children
      ),//Stack
    );//Scaffold
  }//Widget build
}