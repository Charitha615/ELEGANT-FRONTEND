import 'package:elegant_fit_on/screens/3DAvatar/previewav.dart';
import 'package:flutter/material.dart';

import '../3DAvatar/avatar.dart';
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
      new TextEditingController(text: '16');
  TextEditingController hipController = new TextEditingController(text: '32');
  TextEditingController lengthController =
      new TextEditingController(text: '34');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text("ELEGANT FIT ON",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'League Gothic',
                  color: Color.fromARGB(255, 181, 10, 224))),
        ),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 55),
            child: Container(
              //  alignment: Alignment.topRight,
              width: 80,
              child: Image.asset(
                'assets/images/Picture1.png',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                // 'assets/images/Picture1.png',
                'assets/images/bk.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.12,
              // child: Center(child: FlutterLogo(size: 300)),
            ),
          ),
          child: Padding(
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
                  padding: EdgeInsets.all(20),
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
                  padding: EdgeInsets.all(20),
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
                  padding: EdgeInsets.all(20),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 85),
                      child: SizedBox(
                        child: Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Avatar(),
                                  // previewav(s, i, j, k),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/previous.png',
                              width: 60.0,
                              height: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 181, 10, 224),
                                (Color.fromARGB(255, 9, 24, 230)),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              (BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ))
                            ]),
                        height: 40.0,
                        width: 100.0,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color:
                              Color.fromARGB(255, 9, 24, 230).withOpacity(0.00),
                          child: Text('Confirm'),
                          onPressed: () {
                            print(shoulderController.text);
                            i = int.parse(shoulderController.text);
                            j = int.parse(hipController.text);
                            k = int.parse(lengthController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sitems(s, i, j,
                                    k), //myshoulderwidth, myhip, myleglength
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
