import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("ELEGANT FIT ON",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          backgroundColor: Colors.white,
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Icon(
          //         Icons.menu_rounded,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       text: 'Add',
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.tv,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       text: 'Add',
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.movie,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       text: 'Add',
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.video_call,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       text: 'Add',
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.search,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       text: 'Add',
          //     ),
          //   ],
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Container(
                //  alignment: Alignment.topRight,
                width: 40,
                child: Image.asset(
                  'assets/images/Picture1.png',
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
            //   child: Icon(
            //     Icons.notifications_active,
            //     color: Colors.pinkAccent,
            //     size: 25,
            //   ),
            // ),
          ],
        ),
        body: Center(
          child: Container(
            // color: Color.fromARGB(255, 247, 247, 247),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  // 'assets/images/Picture1.png',
                  'assets/images/bk.jpg',
                ),
                fit: BoxFit.cover,
                opacity: 0.5,
                // child: Center(child: FlutterLogo(size: 300)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: InkWell(
                    onTap: () async {},
                    child: Image.asset(
                      'assets/images/clothes/shirt0.png',
                      // 'assets/images/shirt0.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: InkWell(
                    onTap: () async {},
                    child: Image.asset(
                      'assets/images/clothes/shirt0.png',
                      // 'assets/images/shirt0.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: InkWell(
                    onTap: () async {},
                    child: Image.asset(
                      'assets/images/clothes/shirt0.png',
                      // 'assets/images/shirt0.jpg',
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
