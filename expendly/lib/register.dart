import 'package:flutter/material.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State createState() => new RegisterScreenState();
}//RegisterScreen

class RegisterScreenState extends State<RegisterScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Nombre, ApellidoP, ApellidoM, FechaNacimiento, Correo, Usuario, Contrasena, ConfirmarContrasena, ValidaContrasena;

  void ValidarRegistro() {
    final Form = FormKey.currentState;
    if(Form.validate()){
      Form.save();
      print("El formulario es validado.");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    else{
      print("El formulario es invalido.");
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
                        labelText: "Usuario:",
                        fillColor: Colors.white,
                      ),//InputDecoration
                      keyboardType: TextInputType.text,
                      validator: (value) => value.isEmpty ? "Debe llenar este campo!" : null,
                      onSaved: (value) => Usuario = value,
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
                          ValidaContrasena = value;
                          return null;
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
                      onPressed: ValidarRegistro,
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
}//LoginScreen