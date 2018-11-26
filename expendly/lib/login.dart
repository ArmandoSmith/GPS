import 'package:flutter/material.dart';
import 'menu.dart';
import 'register.dart';
import 'forgotPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget{

  static const String routeName = "/login";

  @override
  State createState() => new LoginScreenState();
}//LoginScreen

class LoginScreenState extends State<LoginScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Correo, Contrasena;

  bool ValidarUsuario() {
    final Form = FormKey.currentState;
    if(Form.validate()){
      Form.save();

      print("El formulario es validado. Correo: $Correo, Contraseña: $Contrasena");
      return true;
    }
    else{
      print("El formulario es invalido. Correo: $Correo, Contraseña: $Contrasena");
      return false;
    }
  }
  void Validar_Enviar() async
  {
    if(ValidarUsuario())
    {
      try
      {
        FirebaseUser usuario = await FirebaseAuth.instance.signInWithEmailAndPassword(email: Correo, password: Contrasena);
        print('Usuario: ${usuario.uid}');

        //Acceso a la app
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
          );
      }
      catch (e)
      {
        print('Error: $e');
        Alerta_DatosIncorrectos();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'imagenes/fondo.png',
            fit: BoxFit.cover,
          ),//Image
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.all(20.0),
                  child:
                  new Image.asset(
                    'imagenes/logo.png',
                  ),//Image
              ),//Container
              new Container(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: Icon(Icons.account_box),
                          labelText: "Correo:",
                          fillColor: Colors.white,
                        ),//InputDecoration
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty ? "Campo obligatorio" : null,
                        onSaved: (value) => Correo = value,
                      ),//TextFormField
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: Icon(Icons.https),
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
                        onPressed: Validar_Enviar,
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

  void Alerta_DatosIncorrectos()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Regresar la alerta
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text("Correo o contraseña incorrectos."),
          actions: <Widget>[
            //Botones de la alerta
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}//LoginScreen