import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    'Não deixe que as pessoas te façam desistir daquilo que você mais quer na vida. Acredite. Lute. Conquiste. E acima de tudo, seja feliz.',
    'Algumas vezes coisas ruins acontecem em nossas vidas para nos colocar na direção das melhores coisas que poderíamos viver.',
    'Se a vida não ficar mais fácil, trate de ficar mais forte.',
    'Toda conquista começa com a decisão de tentar.',
    'Insista, persista e nunca desista.',
    'Todo esforço tem a sua recompensa.',
  ];

  // ignore: unused_field
  var _frasesDia = "Frases do Dia";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _frasesDia = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // decoration:BoxDecoration(border: Border.all(width: 3, color: Colors.amber)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(""),
              Text(
                _frasesDia,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: _gerarFrase,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
