import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:ssh/ssh.dart';

import 'output.dart';

void reassemble() {}

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant FitOn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Elegant FitOn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _result = '';
  String backendip = "192.168.8.129";

  // Future<void> imageprocess(int num) async {
  //   print("Connecting to backend...");
  //   var client = SSHClient(
  //     host: backendip,
  //     port: 22,
  //     username: "root",
  //     passwordOrKey: "Lucky",
  //   );

  //   String result;
  //   try {
  //     result = await client.connect();
  //     if (result == "session_connected") {
  //       result = await client.execute(
  //           "sh /home/pavithra/Documents/nimesha/shortgenerator.sh $num");
  //     }
  //     print('Shirt Added');
  //     print(result);
  //     client.disconnect();
  //   } on PlatformException catch (e) {
  //     // print('Error: ${e.code}\nError Message: ${e.message}');
  //     print("Connection Failed");
  //   }
  // }

  // void videoretrieve() async {
  //   print("Connecting to backend...");
  //   var client = SSHClient(
  //     host: backendip,
  //     port: 22,
  //     username: "root",
  //     passwordOrKey: "Lucky",
  //   );

  //   String result;
  //   try {
  //     result = await client.connect();
  //     if (result == "session_connected") {
  //       result = await client.execute(
  //           "sshpass -p 'Lucky' scp -r /opt/nimz/pix2surf/video.mp4 192.168.8.108:d:/Temp/Nimz_Proj/flutter/elegantfiton/assets/videos");
  //       print("Loaded");
  //     }
  //     client.disconnect();
  //   } on PlatformException catch (e) {
  //     print('Error: ${e.code}\nError Message: ${e.message}');
  //   }

  //   // Restart.restartApp(webOrigin: 'http://127.0.0.1:42311/zfE5lVkRixU=/#/vm');
  //   // var result6 = await Process.runSync('flutter', ['arguments']);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      // onTap: () {
                      //   print('Adding the Short...');
                      //   imageprocess(0);
                      // },
                      child: Image.asset(
                        'assets/images/shorts0.jpg',
                        width: 160.0,
                        height: 160.0,
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      // onTap: () {
                      //   print('Adding the Short...');
                      //   imageprocess(1);
                      // },
                      child: Image.asset(
                        'assets/images/shorts1.jpg',
                        width: 160.0,
                        height: 160.0,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    // onTap: () {
                    //   print('Adding the Short...');
                    //   imageprocess(2);
                    // },
                    child: Image.asset(
                      'assets/images/shorts2.jpg',
                      width: 160.0,
                      height: 160.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    // onTap: () {
                    //   print('Adding the Short...');
                    //   imageprocess(3);
                    // },
                    child: Image.asset(
                      'assets/images/shorts3.jpg',
                      width: 160.0,
                      height: 160.0,
                    ),
                  )),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    // onTap: () {
                    //   print('Adding the Short...');
                    //   imageprocess(4);
                    // },
                    child: Image.asset(
                      'assets/images/shorts4.jpg',
                      width: 160.0,
                      height: 160.0,
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    // onTap: () {
                    //   print('Adding the Short...');
                    //   imageprocess(5);
                    // },
                    child: Image.asset(
                      'assets/images/shorts5.jpg',
                      width: 160.0,
                      height: 160.0,
                    ),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    // OutlinedButton(
                    //   onPressed: videoretrieve,
                    //   child: const Text('Process'),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 40),
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
                        // child: RaisedButton(
                        //   elevation: 30,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(0.0),
                        //       side: BorderSide(
                        //           color: Color.fromRGBO(0, 160, 227, 1))),
                        //   // onPressed: videoretrieve,
                        //   onPressed: () {},

                        //   padding: EdgeInsets.all(10.0),
                        //   color: Color.fromRGBO(0, 160, 227, 1),
                        //   textColor: Colors.white,
                        //   child: Text("Process".toUpperCase(),
                        //       style: TextStyle(fontSize: 15)),
                        // ),
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
                        // child: RaisedButton(
                        //   elevation: 30,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(0.0),
                        //       side: BorderSide(
                        //           color: Color.fromRGBO(0, 160, 227, 1))),
                        //   onPressed: () {
                        //     // debugPrint('Received Process');
                        //     reassemble();
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => VideoPlayerApp()));
                        //   },
                        //   padding: EdgeInsets.all(10.0),
                        //   color: Color.fromRGBO(0, 160, 227, 1),
                        //   textColor: Colors.white,
                        //   child: Text("View".toUpperCase(),
                        //       style: TextStyle(fontSize: 15)),
                        // ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
