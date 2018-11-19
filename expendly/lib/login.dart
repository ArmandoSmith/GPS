import 'package:flutter/material.dart';
import 'menu.dart';
import 'register.dart';
import 'forgotPassword.dart';

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
                            new FlatButton(
                              onPressed:  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                                );//Navigator
                              },//onPressed
                              child: new Text(
                                  "¿Olvido su contraseña?",
                                  style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),//TextStyle
                              ),//Text
                            ),//FlatButton
                            new FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                                );//Navigator
                              },//onPressed
                              child: new Text("Registrarse",
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),//TextStyle
                              ),//Text
                            ),//FlatButton
                          ],//Children "Column"
                        ),//Column
                      ),//Cneter
                    ],//Children "Column"
                  ),//Column
                ),//Form
              ),//Container
            ],//Children "Column"
          ),//Column
        ],//Children "column"
      ),//Column
    );//Scaffold
  }//Widget build
}//LoginScreen