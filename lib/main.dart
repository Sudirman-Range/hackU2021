import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Today Diagnosis',
      theme: ThemeData(fontFamily: 'HonokaMaru'),
      home: Diagnosis(),
    );
  }
}

class Diagnosis extends StatelessWidget {
  final List<int> list = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    height: 20,
                    width: 90,
                    child: Center(
                      child: Text('skip',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                          )),
                    )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Center(
              child: Text(
                '今日の評価',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TapBotton(),
        ],
      ),
    );
  }
}

class TapBotton extends StatefulWidget {
  @override
  _TapBottonState createState() => _TapBottonState();
}

class _TapBottonState extends State<TapBotton> {
  static List<String> unicode = [
    '\u{1f606}',
    '\u{1f603}',
    '\u{1f610}',
    '\u{1f628}',
    '\u{1f62B}'
  ];
  static List<String> condition = ['最高！', 'まあまあ', '普通', 'よくない', '最悪...'];
  static int tapedContainer;

  Widget TapedBotton(int containerNum, String unicode, String condition) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapedContainer = containerNum;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: 32,
        ),
        height: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
              ),
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Container(
              height: 85,
              width: 85,
              child: Center(
                child: Text(
                  '$unicode',
                  style: TextStyle(
                    fontSize: 55,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$condition',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget unTapedBotton(int containerNum, String unicode, String condition) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapedContainer = null;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: 32,
        ),
        height: 85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlueAccent,
                blurRadius: 30,
              ),
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Container(
              height: 85,
              width: 85,
              child: Center(
                child: Text(
                  '$unicode',
                  style: TextStyle(
                    fontSize: 55,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Center(
                child: Text(
                  '$condition',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> containerList = [];
    for (int i = 0; i < 5; i++) {
      if (tapedContainer != i) {
        containerList.add(TapedBotton(i, unicode[i], condition[i]));
      } else {
        containerList.add(unTapedBotton(i, unicode[i], condition[i]));
      }
    }
    ;
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: containerList,
        ),
        Container(
          height: 100,
          child: Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: 240,
              height: 53,
              buttonColor: Colors.blueGrey,
              child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  '決定',
                  style: TextStyle(fontSize: 30, color: Colors.black87),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
