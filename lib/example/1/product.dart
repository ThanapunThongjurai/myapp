import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:myappecp/config.dart';
import 'package:myappecp/main.dart';

class ProductAdd extends StatefulWidget {

  ProductAdd(){

  }

  @override
  State<StatefulWidget> createState() {
    return _ProductAdd();
  }
}

class _ProductAdd extends State {

  TextEditingController _productName = TextEditingController();
  TextEditingController _productDescription = TextEditingController();
  TextEditingController _productNumberOfItem = TextEditingController();

  void _onpressProduct(){
      Map params = Map();
      params["name"] = _productName.text;
      params["description"] = _productDescription.text;
      params["numberOfItem"] = _productNumberOfItem.text;
      http.post("${Config.API_URL}/product/add",body: params).then((http.Response res){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => MainScreen())
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "ชื่อสินค้า"),
              controller: _productName,
            ),
            TextField(
              decoration: InputDecoration(hintText: "คำอธิบาย"),
              controller: _productDescription,
            ),
            TextField(
              decoration: InputDecoration(hintText: "จำนวน"),
              keyboardType: TextInputType.number,
              controller: _productNumberOfItem,
            ),
            RaisedButton(
              onPressed: _onpressProduct,
              child: Text("ตกลง"),
            )
          ],
        ),
      ),
    );
  }
}
