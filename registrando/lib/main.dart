import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'galeria.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: new Center(
              child: Text(
                "Registrando",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff212121)),
              ),
            ),
            backgroundColor: Color(0xffff3d00),
          ),
          resizeToAvoidBottomPadding: false,
          body: SafeArea(
            child: MyApp(),
          ),
        ),
        routes: <String, WidgetBuilder>{
          '/galeria': (BuildContext context) => new Galeria(),
        }),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _imagemFile;

  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();

  bool _isButtonDisabled = false;

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imagemFile = File(pickedImage.path);
    });
    setState(() => _isButtonDisabled = !_isButtonDisabled);
  }

  Future choiceCamera() async {
    var pickedCamera = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _imagemFile = File(pickedCamera.path);
    });
    setState(() => _isButtonDisabled = !_isButtonDisabled);
  }

  void _resetFields() {
    setState(() => _imagemFile = null);
    setState(() => _isButtonDisabled = !_isButtonDisabled);
    Fluttertoast.showToast(
        msg: "Imagem apagada", toastLength: Toast.LENGTH_SHORT);
  }

  Future uploadImage() async {
    final uri = Uri.parse("http://192.168.0.102/api_uplode/ipload_img.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['nome'] = nameController.text;
    var pic = await http.MultipartFile.fromPath("image", _imagemFile.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('image Uploded');
      Fluttertoast.showToast(
          msg: "Momento registrado ;)", toastLength: Toast.LENGTH_SHORT);
    } else {
      print('image Not Uploded');
      Fluttertoast.showToast(msg: "Não Foi", toastLength: Toast.LENGTH_SHORT);
    }
    setState(() => _isButtonDisabled == false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 130,
        ),
        child: Card(
          color: Color(0xff303030),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffff3d00),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'nem uma imagem selecionada',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Container(
                child: _imagemFile == null ? Text('') : Image.file(_imagemFile),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Add Comentario',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                      color: _isButtonDisabled == false
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: _isButtonDisabled ? null : () => choiceImage(),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera,
                        size: 50,
                        color: _isButtonDisabled == false
                            ? Colors.green
                            : Colors.grey),
                    onPressed: _isButtonDisabled ? null : () => choiceCamera(),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.restore_from_trash,
                      size: 50,
                      color: !_isButtonDisabled == false
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: !_isButtonDisabled ? null : () => _resetFields(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: Colors.white30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 2),
                    width: 400,
                    height: 50,
                    child: Column(children: [
                      Icon(
                        Icons.file_upload,
                        size: 30,
                      ),
                      Text(
                        "Upload Imagem",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                  onPressed: () => uploadImage(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: IconButton(
          padding: EdgeInsets.only(bottom: 50),
          icon: Icon(Icons.apps, size: 60, color: Color(0xffff3d00)),
          onPressed: () {
            Navigator.pushNamed(context, '/galeria');
          }),
    );
  }
}
