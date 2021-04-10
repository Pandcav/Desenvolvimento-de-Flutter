import 'package:flutter/material.dart';
import 'package:lista/provider/prod.dart';
import 'package:lista/routes/routes.dart';
import 'package:lista/service/servico.dart';
import 'package:provider/provider.dart';

class ListaTitle extends StatelessWidget {
  final Prod prod;

  const ListaTitle(this.prod);

  @override
  Widget build(BuildContext context) {
    bool conf = true;

    return Card(
      elevation: 12.0,
      color: conf == true ? Colors.amber[100] : Colors.green,
      child: Container(
        height: 100,
        child: ListTile(
          leading: IconButton(
            padding: const EdgeInsets.all(5),
            icon: Icon(
              Icons.receipt,
              size: 70,
              color: Colors.purple[900],
            ),
            onPressed: () => {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: prod,
              ),
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Container(
              width: 200,
              height: 60,
              child: Text(
                prod.produto,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.only(top: 15),
            child: IconButton(
              icon: Icon(
                Icons.present_to_all,
                size: 40,
                color: Colors.red,
              ),
              onPressed: () =>
                  {Provider.of<Prods>(context, listen: false).remove(prod)},
            ),
          ),
        ),
      ),
    );
  }
}
