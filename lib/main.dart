import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, title: "Truco", home: MyLabel()));
}

class MyLabel extends StatefulWidget {
  @override
  _MyLabel createState() => _MyLabel();
}

class _MyLabel extends State<MyLabel> {
  int _valuenos = 0;
  int _valueeles = 0;

  int pontosnos = 0;
  int pontoseles = 0;

  void _reset() {
    setState(() {
      _valuenos = 0;
      _valueeles = 0;
      pontosnos = 0;
      pontoseles = 0;
    });
  }

  void _changeNos(int delta) {
    setState(() {
      _valuenos += delta;
      if (_valuenos >= 12) {
        _valuenos = 0;
        _valueeles = 0;
        pontosnos++;
      }
    });
  }

  void _changeEles(int delta) {
    setState(() {
      _valueeles += delta;
      if (_valueeles >= 12) {
        _valuenos = 0;
        _valueeles = 0;
        pontoseles++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/background.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(70.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "images/truco.png",
                    fit: BoxFit.cover,
                    height: 150.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Nós:$_valuenos",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Eles:$_valueeles",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FlatButton(
                            color: Colors.green,
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white),
                            ),
                            onPressed: () {
                              _changeNos(-1);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FlatButton(
                            color: Colors.green,
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 40.0, color: Colors.white),
                            ),
                            onPressed: () {
                              _changeNos(1);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlatButton(
                        color: Colors.green,
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changeEles(-1);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlatButton(
                        color: Colors.green,
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                        onPressed: () {
                          _changeEles(1);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      "Truco!",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeNos(3);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      "Truco!",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changeEles(3);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Pontos:$pontosnos",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Pontos:$pontoseles",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.autorenew),
                  onPressed: () {
                    _reset();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
