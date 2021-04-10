import 'package:flutter/material.dart';
import 'package:lista/provider/prod.dart';
import 'package:lista/routes/routes.dart';
import 'package:lista/user-form.dart';
import 'package:lista/view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Prods(),
        )
      ],
      child: MaterialApp(
        title: 'Listando',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => Listando(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
