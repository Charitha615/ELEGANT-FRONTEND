import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'MaleSizeSelection.dart';
import 'FemaleSizeSelection.dart';

// void main() {
//   runApp(new sitems('Male', 16, 24, 32));
// }

class sitems extends StatelessWidget {
  String mygender;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  sitems(@required this.mygender, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegant FitOn',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Sizer(mygender, myshoulderwidth, myhip, myleglength),
      )),
    );
  }
}

class Sizer extends StatefulWidget {
  String mygender;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  Sizer(@required this.mygender, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  @override
  MyHomePage createState() =>
      MyHomePage(mygender, myshoulderwidth, myhip, myleglength);
}

class MyHomePage extends State {
  String mygender;
  int myshoulderwidth;
  int myhip;
  int myleglength;
  MyHomePage(@required this.mygender, @required this.myshoulderwidth,
      @required this.myhip, @required this.myleglength);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Elegant FitOn"),
      // ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "What to shop",
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
              
              SizedBox(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              print(mygender);
                              if (mygender == 'Male') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => msizeselector(
                                          "shirts",
                                          myshoulderwidth,
                                          myhip,
                                          myleglength)),
                                );
                              } else if (mygender == 'Female') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => fsizeselector(
                                          "shirts",
                                          myshoulderwidth,
                                          myhip,
                                          myleglength)),
                                );
                              } else {
                                // print('Gender error in the app');
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Gender Error'),
                                    content: const Text(
                                        'Gender error was found in the app'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Image.asset(
                              'assets/images/MensShirts.jpg',
                              width: 180.0,
                              height: 180.0,
                            ),
                          )),
                        ],
                      ),
                    ),
                          SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            print(mygender);
                            if (mygender == 'Male') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => msizeselector("pants",
                                        myshoulderwidth, myhip, myleglength)),
                              );
                            } else if (mygender == 'Female') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fsizeselector("pants",
                                        myshoulderwidth, myhip, myleglength)),
                              );
                            } else {
                              // print('Gender error in the app');
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gender Error'),
                                  content: const Text(
                                      'Gender error was found in the app'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            'assets/images/MensPants.jpg',
                            width: 180.0,
                            height: 180.0,
                          ),
                        )),
                      ],
                    ),
                          SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            print(mygender);
                            if (mygender == 'Male') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => msizeselector(
                                        "shorts",
                                        myshoulderwidth,
                                        myhip,
                                        myleglength)),
                              );
                            } else if (mygender == 'Female') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fsizeselector(
                                        "shorts",
                                        myshoulderwidth,
                                        myhip,
                                        myleglength)),
                              );
                            } else {
                              // print('Gender error in the app');
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Gender Error'),
                                  content: const Text(
                                      'Gender error was found in the app'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            'assets/images/MensShorts.jpg',
                            width: 180.0,
                            height: 180.0,
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 8, 12, 240),
    Color.fromARGB(255, 189, 8, 235)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

Widget _small(BuildContext context) {
  return AlertDialog(
    title: const Text('Preview'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/images/img_0000.png',
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _medium(BuildContext context) {
  return AlertDialog(
    title: const Text('Preview'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/images/img_0001.png',
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Widget _large(BuildContext context) {
  return AlertDialog(
    title: const Text('Preview'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/images/img_0002.png',
        )
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
