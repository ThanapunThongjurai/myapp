import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Lab12(),
  ));
}

class Lab12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Lab12();
  }
}

class _Lab12 extends State {
  double answer;
  TextEditingController _a = TextEditingController();
  TextEditingController _b = TextEditingController();
  TextEditingController _symbol = TextEditingController();

  void kickme() {
    if (_symbol.text == "+") {
      answer = double.parse(_a.text) + double.parse(_b.text);
    }
    if (_symbol.text == "-") {
      answer = double.parse(_a.text) - double.parse(_b.text);
    }
    if (_symbol.text == "*") {
      answer = double.parse(_a.text) * double.parse(_b.text);
    }
    if (_symbol.text == "/") {
      answer = double.parse(_a.text) / double.parse(_b.text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LAB1.2"),
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(hintText: "A"),
            controller: _a,
          ),
          TextField(
            decoration: InputDecoration(hintText: "B"),
            controller: _b,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Symbol"),
            controller: _symbol,
          ),
          RaisedButton(
            onPressed: kickme,
            child: Text("KICK ME"),
          ),
          answer != null
              ? Text('${answer}')
              : Padding(padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}
