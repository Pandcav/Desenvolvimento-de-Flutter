import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");

  var _mensagem = "escolha uma opção abaixo";

  var _ptsU = 0;
  var _ptsA = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      "pedra",
      "papel",
      "tesoura",
    ];
    var numero = Random().nextInt(3);

    var escolhaApp = opcoes[numero];

    print("Escolha do App " + escolhaApp);

    print("Escolha do Usuario " + escolhaUsuario);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra"))
      setState(() {
        _ptsU++;
        this._mensagem = "Parabéns !! VC Ganhou :)";
      });
    else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra"))
      setState(() {
        _ptsA++;
        this._mensagem = "Pena !! VC Perdeu :(";
      });
    else {
      this._mensagem = "Empatamos";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: Padding(
                padding: EdgeInsets.only(
                  right: 50,
                ),
                child: new Text("Jokenpo", textAlign: TextAlign.center))),
        leading: new IconButton(
          icon: new Icon(Icons.gamepad),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerRight,
              child: Text("Pontos: $_ptsA",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /*GestureDetector(
            /*onTap: () {
              print("Clica na imagem padrão");
            },*/
            /*onDoubleTap: () {
              print("Clica na imagem padrão duas vezes");
            },*/
            /*onLongPress: () {
              print("Clica na imagem padrão duas vezes");
            },*/
            child:
          ),*/
          Image(
            image: this._imagemApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('papel');
                },
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('pedra');
                },
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada('tesoura');
                },
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Pontos: $_ptsU",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ],
      ),
    );
  }
}
