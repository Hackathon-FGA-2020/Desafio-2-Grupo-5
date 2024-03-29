import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/choose.dart';
import 'package:mobile/details.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/donations.dart';

import 'donations.dart';
import 'donations.dart';

class Entrar extends StatefulWidget {
  @override
  _EntrarState createState() => new _EntrarState();
}

final senha = TextEditingController();
final email = TextEditingController();
final nome = TextEditingController();

class _EntrarState extends State<Entrar> {
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  Future<String> getData(BuildContext context) async {
    http.Response response = await http.post(
        Uri.encodeFull("http://localhost:3333/login"),
        body: {"email": email.text, "password": senha.text});
    var jsonData = response.body;
    var parsedJson = json.decode(jsonData);
    var status = parsedJson['status'];
    // if (status == 200) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => Choose()));
    // } else {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => Choose()));
    // }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Choose()));
  }

  Widget TotalCases() {
    return (Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 100.0)),
        new GestureDetector(
          onTap: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Donations()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xFFC5CAE9),
          ),
        )
      ],
    ));
  }

  Widget SubTitle() {
    return (Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 100)),
        Container(
          width: displayWidth(context) * 0.8,
          child: Text(
            'Faça seu login.',
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    ));
  }

  Widget ListItem() {
    return (Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 200.0, bottom: 32.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 330.0,
              height: 30.0,
              child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(20.0),
                  color: Color(0xFF536DFE),
                  onPressed: () {
                    getData(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Donations()));
                  },
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 17.0)),
            ButtonTheme(
              minWidth: 330.0,
              height: 30.0,
              child: FlatButton(
                  padding: EdgeInsets.all(20.0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  color: Color(0xFF303F9F),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Choose()));
                  },
                  child: Text(
                    'Não tenho cadastro',
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  )),
            ),
          ],
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      backgroundColor: Color(0xFF303F9F),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                TotalCases(),
                SubTitle(),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       top: 30.0, left: 16.0, right: 16.0, bottom: 16.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.people),
                //         border: OutlineInputBorder(
                //           borderSide:
                //               const BorderSide(color: Colors.grey, width: 0.0),
                //         )
                //         hintText: 'Nome completo'),
                //     /*   controller: myController, */
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          hintText: 'E-mail'),
                      controller: email),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'Senha'),
                    controller: senha,
                  ),
                ),
                ListItem(),
              ])),
        )
      ]),
    );
  }
}
