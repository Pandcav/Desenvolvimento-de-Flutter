import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CalculadoraImc extends StatefulWidget {
  @override
  _CalculadoraImcState createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _infoText = "Informe seus Dados";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //função de reset
  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus Dados";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.5) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        _infoText = "Peso normal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25.0 && imc <= 29.9) {
        _infoText = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.9) {
        _infoText = "Obesidade grau 1 (${imc.toStringAsPrecision(3)})";
      } else {
        _infoText = "Obesidade grau 2 (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text(
          "Calculadora IMC",
          style: TextStyle(color: Colors.grey[600]),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          //icone do reset
          IconButton(
            icon: Icon(Icons.refresh),
            //chamada da função do reset
            onPressed: _resetFields,
            color: Colors.grey[600],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //icone grande
              GestureDetector(
                child: Image.asset(
                  "img/a1.png",
                ),
              ),
              //imput com o texto dentro (primeitro input)
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[900], fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insire seu Peso";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle:
                      TextStyle(color: Colors.grey[900], fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[900], fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira sua Altura";
                  }
                },
              ),
              //botão
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    //estilo do texto do botão
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
                    ),
                    //função do botão
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    //cor do botão
                    color: Colors.grey[900],
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
