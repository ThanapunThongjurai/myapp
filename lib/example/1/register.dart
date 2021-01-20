import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }

}

class _Register extends State {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: (Text("Register")),
       backgroundColor: Colors.orange,
     ),
   );
  }

}