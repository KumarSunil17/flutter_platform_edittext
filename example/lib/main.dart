import 'package:flutter/material.dart';
import 'package:flutterplatformedittext/platform_edit_text.dart';
import 'package:flutterplatformedittext/text_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Platform View',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _value = '';

  late EditTextController controller;

  void _resetValue() {
    setState(() {
      _value = '';
      controller.clearText();
    });
  }

  void _getValue() {
    controller.getText().then((value) {
      setState(() {
        _value = value;
      });
    });
  }

  void _setValue() {
    controller.setText("From flutter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform View'),
      ),
      body: Column(
        children: <Widget>[
          PlatFormEditText(
            onEditTextCreated: (controller) {
              this.controller = controller;
              controller.getText().then((value) {
                print(value);
                setState(() {
                  _value = value;
                });
              });
            },
          ),
          Text(
            '$_value',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _getValue,
            tooltip: 'Get',
            child: Icon(Icons.get_app),
          ),
          SizedBox(width: 100),
          FloatingActionButton(
            onPressed: _resetValue,
            tooltip: 'Reset',
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 100),
          FloatingActionButton(
            onPressed: _setValue,
            tooltip: 'Set',
            child: Icon(Icons.file_upload),
          ),
        ],
      ),
    );
  }
}
