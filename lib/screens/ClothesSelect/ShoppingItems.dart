import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'MaleSizeSelection.dart';
import 'FemaleSizeSelection.dart';
import 'msrnt.dart';

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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text("ELEGANT FIT ON",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'League Gothic',
                  color: Color.fromARGB(255, 195, 32, 221))),
        ),
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
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
          // color: Color.fromARGB(255, 255, 255, 255),
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Category Selection",
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
                              print(myshoulderwidth);
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
                              'assets/images/clothes/ShirtsImage.png',
                              width: 180.0,
                              height: 180.0,
                              // fit: BoxFit.cover,
                            ),
                          )),
                          // Expanded(
                          //   child: Text(
                          //     'Text Message',
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 22.0),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
                            'assets/images/clothes/pantsImage.png',
                            width: 180.0,
                            height: 180.0,
                          ),
                        )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, top: 140),
                          child: SizedBox(
                            child: Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => msrnt(
                                            "Male",
                                            myshoulderwidth,
                                            myhip,
                                            myleglength)),
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
                          padding: const EdgeInsets.only(left: 20),
                          child: Expanded(
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
                                'assets/images/clothes/ShortsImage.png',
                                width: 180.0,
                                height: 180.0,
                              ),
                            ),
                          ),
                        ),
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
