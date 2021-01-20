
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myappecp/main.dart';
import 'package:myappecp/register.dart';
void main() {
  runApp(MaterialApp(
    home: Main(),
    debugShowCheckedModeBanner: false,
  ));
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Main();
  }
}

class _Main extends State {
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();
  String flaguser = null;

  void _onLogin() {
    print(_userName.text);
    print(_passWord.text);

    Map dataLogin = Map();
    dataLogin["userName"] = _userName.text;
    dataLogin["passWord"] = _passWord.text;

    if (_userName.text == "Nameless" && _passWord.text == "Nameless") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (Route<dynamic> route) => false,
      );
    }

    // do berfor res 1

    // http.post('$Config.API_URL/user/login', body: dataLogin).then((res) {
    //   Map resMap = jsonDecode(res.body) as Map;
    //   int data =resMap["data"]; //data form res.body
    //   //do something
    //   if (data == 1) {
    //     //have
    //     flaguser = "มีผู้ใช้";
    //   } else {
    //     //no have
    //     flaguser = "ไม่มีผู้ใช้";
    //   }
    //   setState(() {
    //   });
    //});

    // do berfor res 2
  }

  void _Register() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('ECP')),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150, right: 30, left: 30),
            child: Column(
              children: [
                flaguser != null
                    ? Text('login success $flaguser')
                    : Padding(padding: EdgeInsets.zero),
                TextField(
                  decoration: InputDecoration(hintText: 'username'),
                  controller: _userName,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'password'),
                  controller: _passWord,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, right: 60, left: 60),
            child: Column(
              children: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Register()));
                    },
                    child: Text('REGISTER')),
                RaisedButton(
                  onPressed: _onLogin,
                  child: Text('LOGIN'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
