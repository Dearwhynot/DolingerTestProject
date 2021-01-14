import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';
import 'package:DolingerTestProject/screens/seccondScreen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Тестовое задание'),
          leading: Icon(Icons.text_snippet),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final int maxContentLengthPlaceholderShow = 3500;
  final _urlController = TextEditingController();
  final _quantityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final validateURL =
      ValidationBuilder().url('Введите корректную ссылку').build();

  void getSize(String url, int quantity) async {
http.Response response = await http.head(url);
    if (response.statusCode == 200) {
      print("content-length ---- " + response.headers["content-length"]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondRoute(
            url,
            (int.parse(response.headers["content-length"]) >
                maxContentLengthPlaceholderShow),
            quantity,
          ),
        ),
      );
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _urlController,
            validator: validateURL,
            decoration: InputDecoration(labelText: 'Ссылка'),
          ),
          TextFormField(
            controller: _quantityController,
            decoration: InputDecoration(labelText: 'Число'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Заполните поле';
              }
              if (int.parse(value) < 3 ||
                  int.parse(value) > 5 ||
                  value.isEmpty) {
                return 'Допустимые значения от 3 до 5';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  getSize(
                      _urlController.text, int.parse(_quantityController.text));
                }
              },
              child: Text('Отправить'),
            ),
          ),
        ],
      ),
    );
  }
}
