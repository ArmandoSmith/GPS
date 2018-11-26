import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget{
  @override
  State createState() => new ForgotPasswordScreenState();
}//ForgotPasswordScreen

class ForgotPasswordScreenState extends State<ForgotPasswordScreen>{

  final FormKey = new GlobalKey<FormState>();

  String Correo;

  bool ValidarRecuperacion() 
  {
    final Form = FormKey.currentState;
    if(Form.validate()) 
    {
      Form.save();
      print("El formulario es válido.");
      print("Correo: ${Correo}");
      return true;
    }
    else
    {
      print("El formularo es inválido.");
      return false;
    }
  }

  void RecuperarPassword() async
  {
    if(ValidarRecuperacion())
    {
      try
      {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: Correo);
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );

        Alerta_Exito();
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
                      onPressed: RecuperarPassword,
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

  void Alerta_DatosIncorrectos()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Regresar la alerta
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text("No se ha encontrado un usuario con esa dirección de correo electrónico"),
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

  void Alerta_Exito()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //Regresar la alerta
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text("Restablecimiento exitoso, en un momento recibirá un correo."),
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
}