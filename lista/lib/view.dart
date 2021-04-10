import 'package:flutter/material.dart';
import 'package:lista/components/lista.dart';
import 'package:lista/provider/prod.dart';
import 'package:lista/routes/routes.dart';

import 'package:provider/provider.dart';

class Listando extends StatefulWidget {
  @override
  _ListandoState createState() => _ListandoState();
}

class _ListandoState extends State<Listando> {
  @override
  Widget build(BuildContext context) {
    final Prods prod = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text("Listando"),
        ),
      ),
      body: ListView.builder(
        itemCount: prod.count,
        itemBuilder: (ctx, i) => ListaTitle(prod.byIndex(i)),
      ),
      backgroundColor: Colors.blue[100],
      bottomNavigationBar: FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
        },
        child: Card(
          elevation: 10,
          color: Colors.black26,
          child: Container(
            width: 100,
            height: 50,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
