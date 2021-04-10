import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Upload + MSQL"),
        ),
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: MyApp(),
        ),
      ),
    ),
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
    final uri = Uri.parse("http://192.168.0.106/api_uplode/ipload_img.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['nome'] = nameController.text;
    var pic = await http.MultipartFile.fromPath("image", _imagemFile.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 200) {
      print('image Uploded');
      Fluttertoast.showToast(msg: "Foi", toastLength: Toast.LENGTH_SHORT);
    } else {
      print('image Not Uploded');
      Fluttertoast.showToast(msg: "Não Foi", toastLength: Toast.LENGTH_SHORT);
    }
    setState(() => _isButtonDisabled == false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Container(
              child: _imagemFile == null
                  ? Text('nem uma imagem selecionada')
                  : Image.file(_imagemFile),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add_photo_alternate,
                    size: 50,
                    color:
                        _isButtonDisabled == false ? Colors.blue : Colors.grey,
                  ),
                  onPressed: _isButtonDisabled ? null : () => choiceImage(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.restore_from_trash,
                    size: 50,
                    color:
                        !_isButtonDisabled == false ? Colors.red : Colors.grey,
                  ),
                  onPressed: !_isButtonDisabled ? null : () => _resetFields(),
                ),
                IconButton(
                  icon: Icon(Icons.add_a_photo,
                      size: 50,
                      color: _isButtonDisabled == false
                          ? Colors.green
                          : Colors.grey),
                  onPressed: _isButtonDisabled ? null : () => choiceCamera(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text("Upload Imagem"),
              onPressed: () => uploadImage(),
            )
          ],
        ),
      ),
    );
  }
}
