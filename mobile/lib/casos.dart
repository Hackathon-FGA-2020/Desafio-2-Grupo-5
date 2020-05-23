import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/cadastroDonation.dart';
import 'package:mobile/details.dart';
import 'package:http/http.dart' as http;

class Casos extends StatefulWidget {
  @override
  _CasosState createState() => new _CasosState();
}

class _CasosState extends State<Casos> {
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }

  Widget Title() {
    return (Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 60.0)),
        Text(
          'Casos cadastrados',
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ));
  }

  Widget TotalCases() {
    return (Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 100.0)),
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
            'Todos os seus casos cadastrados',
            textAlign: TextAlign.left,
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC5CAE9),
            ),
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
        Padding(padding: EdgeInsets.only(top: 230.0, bottom: 120.0)),
        Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(8.0),
              color: Color(0xFF3F51B5),
            ),
            padding: EdgeInsets.only(top: 30.0, left: 24.0),
            width: displayWidth(context) * 0.85,
            height: displayHeight(context) * 0.4,
            child: Column(
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Caso: ',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 200.0),
                          child: Icon(
                            Icons.delete,
                            color: Color(0xFFC5CAE9),
                          )),
                    ]),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Cadelinha atropelada',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC5CAE9),
                        ),
                      ),
                    ]),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Descrição:',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: displayWidth(context) * 0.7,
                          child: Text(
                            'A cadelinha jolie foi atropelada por um carro no bairro Santana e teve que passar por uma cirurgia às pressas.',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC5CAE9),
                            ),
                          ))
                    ]),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Valor',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'RS 120,00 reais',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC5CAE9)),
                      )
                    ]),
              ],
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      backgroundColor: Color(0xFF303F9F),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE02041),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CadastroDonation()));
        },
        child: Icon(Icons.add),
      ),
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                TotalCases(),
                Title(),
                SubTitle(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
              ])),
        )
      ]),
    );
  }
}
