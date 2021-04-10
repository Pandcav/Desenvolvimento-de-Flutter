import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "App 1",
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas 0",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  onPressed: () {
                    print("+1");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  child: Text(
                    "-1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  onPressed: () {
                    print("-1");
                  },
                ),
              ),
            ],
          ),
          Text(
            "Pode entrar",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ],
      )));
}
