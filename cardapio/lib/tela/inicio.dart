import 'package:cardapio/rotas/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Inicio extends StatefulWidget {
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  final _form = GlobalKey<FormState>();
  TextEditingController mesaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          //color: Colors.amberAccent,
          child: Text(
            "SelfPed",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xffe6020a),
      ),
      backgroundColor: Color(0xffe6020a),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            color: Colors.transparent,
            width: 350,
            height: 500,
            padding: EdgeInsets.only(top: 80, left: 20, bottom: 80, right: 20),
            child: Card(
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              elevation: 20.0,
              child: Container(
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Bem vindo",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Vamos começar seu pedido ",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Digite seu nome',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          controller: nomeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insira o seu nome!";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 80, right: 80),
                        child: TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Numero da mesa',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textAlign: TextAlign.center,
                          controller: mesaController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insira o numero da mesa!";
                            }
                          },
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 50, right: 50),
                          child: Card(
                            elevation: 12,
                            child: Container(
                              height: 50,
                              child: RaisedButton(
                                color: Colors.red,
                                child: new Center(
                                  child: Text(
                                    'Prosseguir',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  final isValid = _form.currentState.validate();
                                  if (isValid) {
                                    _form.currentState.save();

                                    Fluttertoast.showToast(
                                        msg: "Preparando o cardapio",
                                        toastLength: Toast.LENGTH_SHORT);
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRoutes.CARDAPIO);
                                  }
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
