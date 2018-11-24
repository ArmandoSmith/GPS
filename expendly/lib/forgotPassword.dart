import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  State createState() => new ForgotPasswordScreenState();
}//ForgotPasswordScreen

class ForgotPasswordScreenState extends State<ForgotPasswordScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Correo;

  void ValidarRecuperacion() {
    final Form = FormKey.currentState;
    if(Form.validate()) {
      Form.save();
      print("El formulario es valido.");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    else{
      print("El formularo es invalido.");
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
          new Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: FormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Introduzca su dirección de correo:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value.isEmpty ? "Debe introducir un correo!" : null,
                      onSaved: (value) => Correo = value,
                    ),//TextFormField
                    new RaisedButton(
                      child: Text("Recuperar contraseña"),
                      color: Colors.white,
                      onPressed: ValidarRecuperacion,
                    ),//RaisedButton
                  ],//Column children
                ),//Column
              ),//Form
            ),//Container
          ),//Center
        ],//Stack children
      ),//Stack
    );//Sacaffold
  }//Widget build
}