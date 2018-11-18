import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Maquina Expendedora",
      home: new LoginScreen(),
    );
  }//Widget build
}//MyApp

class LoginScreen extends StatefulWidget{
  @override
  State createState() => new LoginScreenState();
}//LoginScreen

class LoginScreenState extends State<LoginScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Usuario, Contrasena;

  void ValidarUsuario() {
    final Form = FormKey.currentState;
    if(Form.validate()){
      Form.save();
      print("El formulario es validado. Usuario: $Usuario, Contraseña: $Contrasena");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuScreen()),
      );
    }
    else{
      print("El formulario es invalido. Usuario: $Usuario, Contraseña: $Contrasena");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/login.png',
            fit: BoxFit.cover,
          ),//Image
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'imagenes/logo.png',
              ),//Image
              new Container(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: Icon(IconData(0xe851, fontFamily: 'MaterialIcons')),
                          labelText: "Usuario:",
                          fillColor: Colors.white,
                        ),//InputDecoration
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty ? "Campo obligatorio" : null,
                        onSaved: (value) => Usuario = value,
                      ),//TextFormField
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: Icon(IconData(0xe88d, fontFamily: 'MaterialIcons')),
                          labelText: "Contraseña:",
                          fillColor: Colors.white,
                        ),//InputDecoration
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty ? "Campo obligatorio" : null,
                        onSaved: (value) => Contrasena = value,
                      ),//TextFormField
                      new RaisedButton(
                        child: Text("Login"),
                        color: Colors.white,
                        onPressed: ValidarUsuario,
                      ),//RaisedButton
                      new Center(
                        child: Column(
                          children: <Widget>[
                            new Text(
                              "¿Olvido su contraseña?",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            new Text("Registrarse",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],//Childrens "Column"
                        ),//Column
                      ),//Cneter
                    ],//Childrens "Column"
                  ),//Column
                ),//Form
              ),//Container
            ],//Childrens "Column"
          ),//Column
        ],//Children's "column"
      ),//Column
    );//Scaffold
  }//Widget build
}//LoginScreen

class MenuScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Text("Hola"),
    );
  }
}//MenuScreen