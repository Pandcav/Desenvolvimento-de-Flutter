import 'package:flutter/material.dart';
import 'package:lista/provider/prod.dart';
import 'package:lista/service/servico.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserForm extends StatefulWidget {
  @override
  _UserForm createState() => _UserForm();
}

class _UserForm extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  int itens = 0;
  void _loadFormData(Prod prod) {
    if (prod != null) {
      _formData['id'] = prod.id;
      _formData['prod'] = prod.produto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Prod prod = ModalRoute.of(context).settings.arguments;
    _loadFormData(prod);

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicione um Mantimento'),
      ),
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 130,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Card(
                color: Colors.black45,
                elevation: 30,
                shadowColor: Color(0xff212121),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 200,
                  child: Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Adicione um Produtos na lista",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 30),
                          child: TextFormField(
                            initialValue: _formData['prod'],
                            decoration: InputDecoration(
                              labelText: 'Produtos',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor insira um nome!';
                              }
                            },
                            onSaved: (value) => _formData['prod'] = value,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 30),
                          child: Text(
                            'Itens adicionados: $itens',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    final isValid = _form.currentState.validate();
                    if (isValid) {
                      _form.currentState.save();
                      Provider.of<Prods>(context, listen: false).put(
                        Prod(
                          id: _formData['id'],
                          produto: _formData['prod'],
                        ),
                      );
                      Fluttertoast.showToast(
                          msg: "Adicionado", toastLength: Toast.LENGTH_SHORT);

                      setState(() {
                        itens++;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
