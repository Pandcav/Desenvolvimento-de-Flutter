import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cardapio/components/prod_tile.dart';

import 'package:flutter/material.dart';

class Pedido extends StatefulWidget {
  @override
  _Pedido createState() => _Pedido();
}

class _Pedido extends State<Pedido> {
  TextEditingController mesaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              "SelfPed",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Card(),
    );
  }
}
