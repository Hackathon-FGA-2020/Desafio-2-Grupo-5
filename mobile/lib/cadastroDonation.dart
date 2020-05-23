import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/casos.dart';
import 'package:mobile/details.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/donations.dart';

class CadastroDonation extends StatefulWidget {
  @override
  _CadastroDonationState createState() => new _CadastroDonationState();
}

class _CadastroDonationState extends State<CadastroDonation> {
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
                context, MaterialPageRoute(builder: (context) => Casos()));
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
        Padding(padding: EdgeInsets.only(bottom: 50)),
        Container(
          width: displayWidth(context) * 0.8,
          child: Text(
            'Cadastrar novo caso',
            textAlign: TextAlign.left,
            style: new TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    ));
  }

  Widget Sub() {
    return (Row(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 100)),
        Container(
          width: displayWidth(context) * 0.8,
          child: Text(
            'Descreva o caso detalhadamente para encontrar um herói para resolver isso.',
            textAlign: TextAlign.left,
            style: new TextStyle(
              fontSize: 17.0,
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Donations()));
                  },
                  child: Text(
                    'Cadastrar',
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
                    /*...*/
                  },
                  child: Text(
                    'Cancelar',
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
                Sub(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 16.0, right: 16.0, bottom: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        hintText: 'Titulo do caso'),
                    /*   controller: myController, */
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Descrição'),
                    /*   controller: myController, */
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 16.0, right: 16.0, bottom: 16.0),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         hintText: 'Valor em reais'),
                //     /*   controller: myController, */
                //   ),
                // ),
                ListItem(),
              ])),
        )
      ]),
    );
  }
}
