import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/donations.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {
  Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    return displaySize(context).width;
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
                  child:
        Icon(
          Icons.arrow_back,
          color: Colors.red,
        ),)
      ],
    ));
  }

  Widget ListItem() {
    return (Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 230.0, bottom: 32.0)),
        Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: 30.0, left: 24.0),
            width: displayWidth(context) * 0.85,
            height: displayHeight(context) * 0.7,
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
                        padding: EdgeInsets.only(left: 143.0),
                        child: Text(
                          'ONG: ',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35.0),
                        child: Text(
                          'APAD',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
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
                              color: Colors.grey,
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
                            color: Colors.grey),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 64.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Salve o dia!',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Seja o herói desse caso.',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 16.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Entre em contato:',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      )
                    ]),
                Padding(padding: EdgeInsets.only(top: 16.0)),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 130.0,
                        height: 30.0,
                        child: FlatButton(
                             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                            padding: EdgeInsets.all(20.0),
                            color: Colors.red,
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              'E-mail',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                      ),
                      Padding(padding: EdgeInsets.only(left: 17.0)),
                      ButtonTheme(
                        minWidth: 130.0,
                        height: 30.0,
                        child: FlatButton(
                            padding: EdgeInsets.all(20.0),
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                            color: Colors.red,
                            onPressed: () {
                              /*...*/
                            },
                            child: Text(
                              'WhatsApp',
                              textAlign: TextAlign.left,
                              style: new TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            )),
                      ),
                    ]),
              ],
            )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.black
));

    return Scaffold(
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[TotalCases(), ListItem()])),
        )
      ]),
    );
  }
}
