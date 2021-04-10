import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProdTile extends StatelessWidget {
  final List list;
  int _num = 0;
  String t = '';
  ProdTile({this.list});
  @override
  Widget build(BuildContext context) {
    void teste() {
      Fluttertoast.showToast(
          msg: "TESTANDO ${_num++}", toastLength: Toast.LENGTH_SHORT);
    }

    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => teste(),
          child: Card(
            elevation: 14.0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 400,
                height: 140,
                child: Material(
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Container(
                            width: 220,
                            height: 110,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        width: 50,
                                        alignment: Alignment(-1, -1),
                                        child: Text(
                                          '${_num}',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 170,
                                        alignment: Alignment(0, -1),
                                        child: Text(
                                          list[i]['cardapio_nome'],
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffe6020a),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Container(
                                    child: Text(
                                      list[i]['cardapio_descricao'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    //color: Colors.amberAccent,
                                    height: 21,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "R\$: ${list[i]['cardapio_valor']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreenAccent[700],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image(
                            fit: BoxFit.contain,
                            alignment: Alignment.topRight,
                            image: NetworkImage(
                                'http://selfped.ml/imagens/${list[i]['cardapio_url_foto']}'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
