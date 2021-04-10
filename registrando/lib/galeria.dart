import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Galeria extends StatefulWidget {
  @override
  _Galeria createState() => _Galeria();
}

class _Galeria extends State<Galeria> {
  Future allPhot() async {
    var url = "http://192.168.0.102/api_uplode/view.php";
    var res = await http.get(url);
    return json.decode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Text(
            'Mural',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffff3d00),
            ),
          ),
        ),
        backgroundColor: Color(0xff212121),
      ),
      backgroundColor: Color(0xffff3d00),
      body: FutureBuilder(
        future: allPhot(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;

                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 10),
                      child: Container(
                        color: Color(0xff212121),
                        height: 390,
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              child: Image.network(
                                'http://192.168.0.102/api_uplode/uploads/${list[index]['imagem']}',
                                scale: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                list[index]['nome'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffff3d00)),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center();
        },
      ),
    );
  }
}
