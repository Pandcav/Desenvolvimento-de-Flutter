import 'dart:convert';

import 'package:cardapio/rotas/routes.dart';
import 'package:http/http.dart' as http;
import 'package:cardapio/components/prod_tile.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future<List> getData(String tipo) async {
      final response = await http.get("http://selfped.ml/?tipo=${tipo}");
      return json.decode(response.body);
    }

    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Container(
              width: 300,
              height: 50,

              //color: Colors.amberAccent,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    alignment: Alignment(1, -1),
                    child: Text(
                      "SelfPed",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 60,
                    alignment: Alignment(1, 1),
                    child: Text(
                      "R\$",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xffe6020a),
      ),
      backgroundColor: Color(0xffe6020a),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 350,
              child: FutureBuilder<List>(
                future: getData('E'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ProdTile(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 350,
              child: FutureBuilder<List>(
                future: getData('P'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ProdTile(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 350,
              child: FutureBuilder<List>(
                future: getData('A'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ProdTile(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 350,
              child: FutureBuilder<List>(
                future: getData('B'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ProdTile(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 350,
              child: FutureBuilder<List>(
                future: getData('S'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ProdTile(
                          list: snapshot.data,
                        )
                      : new Center(
                          child: new CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RaisedButton(
        color: Colors.black54,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Finalizar pedido',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
            ],
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.PEDIDO);
        },
      ),
    );
  }
}
