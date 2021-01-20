import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myappecp/product.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

void main() {
  runApp(MaterialApp(
    home: lab12(),
    debugShowCheckedModeBanner: false,
  ));
}

class Lab1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Lab1();
  }
}

class lab12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _lab12();
  }
}

class _lab12 extends State {
  TextEditingController _A = TextEditingController();
  TextEditingController _B = TextEditingController();
  TextEditingController _Symbol = TextEditingController();
  double Answer;

  @override
  void _Calculate() {

    if(_Symbol.text == "+")
    {
      Answer = double.parse(_A.text) + double.parse(_B.text);
    }
    if(_Symbol.text == "-")
    {
      Answer = double.parse(_A.text) - double.parse(_B.text);
    }
    if(_Symbol.text == "*")
    {
      Answer = double.parse(_A.text) * double.parse(_B.text);
    }
    if(_Symbol.text == "/")
    {
      Answer = double.parse(_A.text) / double.parse(_B.text);
    }

    var arr = [double.parse(_A.text),double.parse(_B.text)];

    for(int i = 0 ; i < arr.length;i++)
      {
        if(arr[i] >Answer)
          {
            Answer = arr[i];
          }
      }
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LAB1.2"),
        ),
        body: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "A"),
              controller: _A,
            ),
            TextField(
              decoration: InputDecoration(hintText: "B"),
              controller: _B,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Symbol"),
              controller: _Symbol,
            ),
            RaisedButton(
              onPressed: _Calculate,
              child: Text("กด"),
            ),
            Answer != null
                ? Text("$Answer")
                :Padding(padding: EdgeInsets.zero,),
          ],
        ));
  }
}

class _Lab1 extends State {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  String flag = "";

  void _check() {
    if (_username.text == "ECP") {
      flag = "รหัสถูกต้อง";
    } else {
      flag = "ไม่รหัสถูกต้อง";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: (Text('ECP')),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          flag != null ? Text('$flag') : Padding(padding: EdgeInsets.zero),
          TextField(
            decoration: InputDecoration(hintText: 'username'),
            controller: _username,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'password'),
            controller: _password,
          ),
          RaisedButton(
            onPressed: _check,
            child: Text("LOGIN"),
          )
        ],
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State {
  List<Widget> _productUI = [];
  List _productList = [];

  @override
  void initState() {
    http.post("${Config.API_URL}/product/list").then((res) {
      Map resMap = jsonDecode(res.body) as Map;
      List resData = resMap["data"];
      _productList = resData;
      setState(() {});
    });
    super.initState();
  }

  Widget _productItem(BuildContext contetxt, int index) {
    String productName = _productList[index]["name"];
    String productDes = _productList[index]["description"];
    int productNumberOfItem = _productList[index]["numberOfItem"];
    Card c = Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${productName} (${productNumberOfItem})"),
            Text("คำอธิบาย : ${productDes}")
          ],
        ));
    return c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: _productItem,
          itemCount: _productList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => ProductAdd())),
      ),
    );
  }
}
