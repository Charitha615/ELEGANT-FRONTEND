import 'dart:io';

import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MenClothesPage());
}

class MenClothesPage extends StatelessWidget {
  const MenClothesPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mens Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = '';

  // Future<void> _sshclient(int num) async {
  //   var client = new SSHClient(
  //     host: "192.168.43.203", //172.20.10.10 //192.168.8.129
  //     port: 22,
  //     username: "root",
  //     passwordOrKey: "Lucky",
  //   );

  //   String result;
  //   try {
  //     result = await client.connect();
  //     if (result == "session_connected") {
  //       result = await client.execute(
  //           "sh /home/pavithra/Documents/nimesha/dressgenerator.sh $num");
  //     }
  //     print('Hello');
  //     print(result);
  //     client.disconnect();
  //   } on PlatformException catch (e) {
  //     print('Error: ${e.code}\nError Message: ${e.message}');
  //   }
  // }

  // Future<void> _sshclient2() async {
  //   var client = new SSHClient(
  //     host: "192.168.8.104",
  //     port: 22,
  //     username: "root",
  //     passwordOrKey: "Lucky",
  //   );

  //   String result;
  //   try {
  //     result = await client.connect();
  //     if (result == "session_connected") {
  //       result = await client.execute(
  //           "cp /opt/nimz/pix2surf/video.mp4 /home/pavithra/Documents/NimzFlutter/flutter_application_1/fnimspp/assets/videos/video.mp4");
  //     }
  //     client.disconnect();
  //   } on PlatformException catch (e) {
  //     print('Error: ${e.code}\nError Message: ${e.message}');
  //   }
  // }

  // void _incrementCounter() async {
  //   _counter++;
  //   // _sshclient();
  //   // print('sshclient');
  //   // _sshclient2();
  //   var client = new SSHClient(
  //     host: "192.168.43.203",
  //     port: 22,
  //     username: "root",
  //     passwordOrKey: "Lucky",
  //   );

  //   String result;
  //   try {
  //     result = await client.connect();
  //     if (result == "session_connected") {
  //       result = await client.execute(
  //           "cp /opt/nimz/pix2surf/video.mp4 /home/pavithra/Documents/NimzFlutter/flutter_application_1/fnimspp/assets/videos/video.mp4");
  //     }
  //     client.disconnect();
  //   } on PlatformException catch (e) {
  //     print('Error: ${e.code}\nError Message: ${e.message}');
  //   }
  //   ;
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        print('Performing Graphics');
                        // _sshclient(0);
                        // sleep(Duration(seconds: 100));
                      },
                      child: Image.asset(
                        'assets/images/shirt0.jpg',
                        width: 200.0,
                        height: 200.0,
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        print('Performing Graphics');
                        // _sshclient(0);
                        // sleep(Duration(seconds: 100));
                      },
                      child: Image.asset(
                        'assets/images/shirt1.jpg',
                        width: 200.0,
                        height: 200.0,
                      ),
                    )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Performing Graphics');
                      // _sshclient(0);
                      // sleep(Duration(seconds: 100));
                    },
                    child: Image.asset(
                      'assets/images/shirt2.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Performing Graphics');
                      // _sshclient(0);
                      // sleep(Duration(seconds: 100));
                    },
                    child: Image.asset(
                      'assets/images/shirt3.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Performing Graphics');
                      // _sshclient(0);
                      // sleep(Duration(seconds: 100));
                    },
                    child: Image.asset(
                      'assets/images/shirt4.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      print('Performing Graphics');
                      // _sshclient(0);
                      // sleep(Duration(seconds: 100));
                    },
                    child: Image.asset(
                      'assets/images/shirt5.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    // OutlinedButton(
                    //   onPressed: videoretrieve,
                    //   child: const Text('Process'),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 60),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 1,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          elevation: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: BorderSide(
                                  color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () {},
                          padding: EdgeInsets.all(10.0),
                          color: Color.fromRGBO(0, 160, 227, 1),
                          textColor: Colors.white,
                          child: Text("Process".toUpperCase(),
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 150),
                    //   child: OutlinedButton(
                    //     onPressed: () {
                    //       // debugPrint('Received Process');
                    //       reassemble();
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => VideoPlayerApp()));
                    //     },
                    //     child: const Text('View'),
                    //   ),
                    // )
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 150),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.1),
                              blurRadius: 1,
                              offset: Offset(10, 10),
                            ),
                          ],
                        ),
                        child: RaisedButton(
                          elevation: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              side: BorderSide(
                                  color: Color.fromRGBO(0, 160, 227, 1))),
                          onPressed: () {},
                          padding: EdgeInsets.all(10.0),
                          color: Color.fromRGBO(0, 160, 227, 1),
                          textColor: Colors.white,
                          child: Text("View".toUpperCase(),
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
