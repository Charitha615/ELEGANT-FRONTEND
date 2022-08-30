import 'dart:io';

import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MendenimesClothesPage());
}

class MendenimesClothesPage extends StatelessWidget {
  const MendenimesClothesPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mens denimes Items'),
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
                        'assets/images/denim1.png',
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
                        'assets/images/denim2.png',
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
                      'assets/images/denim3.png',
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
                      'assets/images/denim4.png',
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
                      'assets/images/denim5.png',
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
                      'assets/images/denim6.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 110),
                child: Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        debugPrint('Received Process');
                      },
                      child: const Text('Process'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 130),
                      child: OutlinedButton(
                        onPressed: () => {},
                        child: const Text('Save'),
                      ),
                    )
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
