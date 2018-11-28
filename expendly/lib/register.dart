import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State createState() => new RegisterScreenState();
}//RegisterScreen

class RegisterScreenState extends State<RegisterScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Nombre, ApellidoP, ApellidoM, FechaNacimiento, Correo, Contrasena, ConfirmarContrasena, ValidaContrasena;

  bool ValidarRegistro() {
    final Form = FormKey.currentState;
    if(Form.validate()){
      Form.save();
      print("El formulario es validado.");
      return true;
    }
    else{
      print("El formulario es invalido.");
      return false;
    }
  }

  void Validar_Enviar() async
  {
    if(ValidarRegistro())
    {
      try
      {
        FirebaseUser usuario = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Correo, password: Contrasena);
        print('Usuario: ${usuario.uid}');
        
        //Acceso a la app
          Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            );
      }
      catch (e)
      {
        print('Error: $e');
        Alerta_ErrorServidor();
        
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
                        labelText: "Nombre:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => Nombre = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Apellido paterno:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => ApellidoP = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Apellido materno:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => ApellidoM = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Fehca de nacimiento:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.datetime,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => FechaNacimiento = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Correo:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => Correo = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Contraseña:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value.isEmpty){
                          return "Debe llenar este campo!";
                        }
                        else{
                          if(value.length < 6){
                            return "La contraseña debe ser mayor a 6 digitos!";
                          }
                          else{
                            ValidaContrasena = value;
                            return null;
                          }
                        }
                      },
                      onSaved: (value) => Contrasena = value,
                    ),//TextFormField
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Confirmar contraseña:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty){
                          return "Debe llenar este campo";
                        }
                        else{
                          if (value != ValidaContrasena){
                            return "Las contraseñas deben ser iguales";
                          }
                          else {
                            return null;
                          }
                        }
                      },
                      onSaved: (value) => ConfirmarContrasena = value,
                    ),//TextFormField
                    new RaisedButton(
                      child: Text("Registrar"),
                      color: Colors.white,
                      onPressed: Validar_Enviar,
                    ),//RaisedButton
                  ],//Column children
                ),//Column
              ),//Form
            ),//Container
          ),//Center
        ],//Stack Children
      ),//Stack
    );//Scaffold
  }//Widget build

  void Alerta_ErrorServidor()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Regresar la alerta
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text("Hubo un error al intentar registrarse, intente de nuevo."),
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