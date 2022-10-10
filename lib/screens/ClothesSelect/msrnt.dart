import 'package:flutter/material.dart';

import 'ShoppingItems.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp("Male", 14, 32, 32),
//   ));
// }

class msrnt extends StatefulWidget {
  String s;
  int i;
  int j;
  int k;
  msrnt(@required this.s, @required this.i, @required this.j, @required this.k);

  @override
  _State createState() => _State(s, i, j, k);
}

class _State extends State<msrnt> {
  String s;
  int i;
  int j;
  int k;
  _State(
      @required this.s, @required this.i, @required this.j, @required this.k);

  TextEditingController shoulderController =
      new TextEditingController(text: '14');
  TextEditingController hipController = new TextEditingController(text: '32');
  TextEditingController lengthController =
      new TextEditingController(text: '34');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Elegant FitOn'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Size Confirmation",
                      style: TextStyle(
                          fontSize: 24,
                          // color: Color.fromARGB(255, 247, 50, 240),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'League Gothic',
                          letterSpacing: 0.7,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: shoulderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Shoulder Width',
                      hintText: 'Enter Your Shoulder Width',
                    ),
                    onChanged: (text) {
                      i = text as int;
                      print(i.toString());
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    // obscureText: true,
                    controller: hipController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Hip Size',
                      hintText: 'Enter Your Hip Size',
                    ),
                    onChanged: (text) {
                      j = text as int;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    // obscureText: true,
                    controller: lengthController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Leg Length',
                      hintText: 'Enter Your Leg Length',
                    ),
                    onChanged: (text) {
                      k = text as int;
                    },
                  ),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromARGB(255, 46, 14, 226),
                  child: Text('Confirm'),
                  onPressed: () {
                    print(shoulderController.text);
                    i = int.parse(shoulderController.text);
                    j = int.parse(hipController.text);
                    k = int.parse(lengthController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sitems(
                            s, i, j, k), //myshoulderwidth, myhip, myleglength
                      ),
                    );
                  },
                )
              ],
            )));
  }
}
