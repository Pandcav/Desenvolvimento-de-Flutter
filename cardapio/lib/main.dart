import 'package:cardapio/rotas/routes.dart';
import 'package:cardapio/tela/inicio.dart';
import 'package:cardapio/tela/pedido.dart';
import 'package:flutter/material.dart';

import 'tela/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SelfPed',
        theme: ThemeData(
          primaryColor: Color(0xffe6020a),
        ),
        routes: {
          AppRoutes.HOME: (_) => Inicio(),
          AppRoutes.PEDIDO: (_) => Pedido(),
          AppRoutes.CARDAPIO: (_) => HomePage()
        });
  }
}
