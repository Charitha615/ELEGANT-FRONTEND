import 'package:elegant_fit_on/screens/ClothesSelect/msrnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import '../3DAvatar/avatar.dart';
import '../ClothesSelect/msrnt.dart';
import '../ClothesSelect/ShoppingItems.dart';

class previewav extends StatefulWidget {
  String s;
  int i;
  int j;
  int k;
  previewav(
      @required this.s, @required this.i, @required this.j, @required this.k);

  @override
  _State createState() => _State(s, i, j, k);
}

class _State extends State<previewav> {
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
                'assets/images/bk.jpg',
              ),
              fit: BoxFit.cover,
              opacity: 0.12,
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
                      "Avatar Preview",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'League Gothic',
                          letterSpacing: 0.7,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ),
                ),
                SizedBox(
                  height: 490,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Cube(
                      onSceneCreated: (Scene scene) {
                        scene.world.add(Object(
                            position: Vector3(0, 2.0, 0),
                            scale: Vector3(6.0, 6.0, 6.0),
                            // fileName: 'assets/avatar/000000.obj'));
                            fileName: 'assets/avatar/000000.obj'));
                      },
                    ),
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
                      padding: const EdgeInsets.only(top: 20, left: 80),
                      child: SizedBox(
                        child: Expanded(
                          child: InkWell(
                            onTap: () {
                              i = int.parse(shoulderController.text);
                              j = int.parse(hipController.text);
                              k = int.parse(lengthController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => msrnt(s, i, j,
                                      k), //myshoulderwidth, myhip, myleglength
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/images/next1.png',
                              width: 60.0,
                              height: 50.0,
                            ),
                          ),
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
