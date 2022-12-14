import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:elegant_fit_on/screens/3DAvatar/lib/body_detection.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/body_mask.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/image_result.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/pose.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/png_image.dart';
import 'package:elegant_fit_on/screens/3DAvatar/pose_mask_painter.dart';
import 'package:elegant_fit_on/screens/3DAvatar/previewav.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:path/path.dart' as Path;

import 'package:permission_handler/permission_handler.dart';
import 'package:ssh/ssh.dart';

import '../ClothesSelect/ShoppingItems.dart';
import '../ClothesSelect/msrnt.dart';
import 'previewav.dart';
import '../home/home_screen.dart';

var fp = null;

void main() {
  runApp(const Avatar());
}

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _enabled = true;

  bool isLoadingspnr = false;
  int _selectedTabIndex = 0;
  String backendip = "192.168.8.158";
  bool _isDetectingPose = false;
  bool _isDetectingBodyMask = false;
  // var fp;
  Image? _selectedImage;
  Pose? _detectedPose;
  ui.Image? _maskImage;
  Image? _cameraImage;
  Size _imageSize = Size.zero;
  // ParseFileBase? parseFile;

  Future<void> _selectImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null || result.files.isEmpty) return;
    final path = result.files.single.path;
    if (path != null) {
      _resetState();
      setState(() {
        _selectedImage = Image.file(File(path));
        fp = File(path);
        print(
            '.....................das..........................................');
        print(fp);
        _showToast(context);
        avatercreate();
      });
    }
  }

  Future<void> _detectImagePose() async {
    PngImage? pngImage = await _selectedImage?.toPngImage();
    if (pngImage == null) return;
    setState(() {
      _imageSize = Size(pngImage.width.toDouble(), pngImage.height.toDouble());
    });
    final pose = await BodyDetection.detectPose(image: pngImage);
    _handlePose(pose);
  }

  Future<void> _detectImageBodyMask() async {
    PngImage? pngImage = await _selectedImage?.toPngImage();
    if (pngImage == null) return;
    setState(() {
      _imageSize = Size(pngImage.width.toDouble(), pngImage.height.toDouble());
    });
    final mask = await BodyDetection.detectBodyMask(image: pngImage);
    _handleBodyMask(mask);
  }

  Future<void> _startCameraStream() async {
    print("_startCameraStream line 74");
    final request = await Permission.camera.request();
    if (request.isGranted) {
      print("isGranted line 77");

      await BodyDetection.startCameraStream(
        onFrameAvailable: _handleCameraImage,
        onPoseAvailable: (pose) {
          if (!_isDetectingPose) return;
          _handlePose(pose);
        },
        onMaskAvailable: (mask) {
          if (!_isDetectingBodyMask) return;
          _handleBodyMask(mask);
        },
      );
      print("isGranted line 91");
    }
  }

  Future<void> _stopCameraStream() async {
    await BodyDetection.stopCameraStream();

    setState(() {
      _cameraImage = null;
      _imageSize = Size.zero;
    });
  }

  void _handleCameraImage(ImageResult result) {
    // Ignore callback if navigated out of the page.
    if (!mounted) return;

    // To avoid a memory leak issue.
    // https://github.com/flutter/flutter/issues/60160
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();

    final image = Image.memory(
      result.bytes,
      gaplessPlayback: true,
      fit: BoxFit.contain,
    );

    setState(() {
      _cameraImage = image;
      _imageSize = result.size;
    });
  }

  void _handlePose(Pose? pose) {
    // Ignore if navigated out of the page.
    if (!mounted) return;

    setState(() {
      _detectedPose = pose;
    });
  }

  void _handleBodyMask(BodyMask? mask) {
    // Ignore if navigated out of the page.
    if (!mounted) return;

    if (mask == null) {
      setState(() {
        _maskImage = null;
      });
      return;
    }

    final bytes = mask.buffer
        .expand(
          (it) => [0, 0, 0, (it * 255).toInt()],
        )
        .toList();
    ui.decodeImageFromPixels(Uint8List.fromList(bytes), mask.width, mask.height,
        ui.PixelFormat.rgba8888, (image) {
      setState(() {
        _maskImage = image;
      });
    });
  }

  Future<void> _toggleDetectPose() async {
    if (_isDetectingPose) {
      await BodyDetection.disablePoseDetection();
    } else {
      await BodyDetection.enablePoseDetection();
    }

    setState(() {
      _isDetectingPose = !_isDetectingPose;
      _detectedPose = null;
    });
  }

  Future<void> _toggleDetectBodyMask() async {
    if (_isDetectingBodyMask) {
      await BodyDetection.disableBodyMaskDetection();
    } else {
      await BodyDetection.enableBodyMaskDetection();
    }

    setState(() {
      _isDetectingBodyMask = !_isDetectingBodyMask;
      _maskImage = null;
    });
  }

  void _onTabEnter(int index) {
    print("_onTabEnter line 180");
    // Camera tab
    if (index == 1) {
      _startCameraStream();
    }
  }

  void _onTabExit(int index) {
    // Camera tab
    if (index == 1) {
      _stopCameraStream();
    }
  }

  void _onTabSelectTapped(int index) {
    _onTabExit(_selectedTabIndex);
    _onTabEnter(index);

    setState(() {
      _selectedTabIndex = index;
    });
  }

  Widget? get _selectedTab => _selectedTabIndex == 0
      ? _imageDetectionView
      : _selectedTabIndex == 1
          ? _cameraDetectionView
          : null;

  void _resetState() {
    setState(() {
      _maskImage = null;
      _detectedPose = null;
      _imageSize = Size.zero;
    });
  }

  void avatercreate() async {
    File file = File(
        '/data/user/0/com.example.elegant_fit_on/cache/file_picker/000000.obj');
    // var file = new File(
    //     "/data/user/0/com.example.elegant_fit_on/cache/file_picker/000000.obj");
    String path = fp.toString();
    String? newqqq = path.split(":").last;
    String ello = newqqq.substring(2, newqqq.length - 1);
    var response;
    if (await file.exists()) {
      // file.deleteSync();
      // print("File deleted................................................");
    }
    // IOSink ios = file.openWrite(mode: FileMode.APPEND);
    // await file.writeAsBytes(response);

    try {
      // print(fp + "headsadasdasdasdasdasdasdasdsadsdasda");
      var formdata =
          FormData.fromMap({"image": await MultipartFile.fromFile(ello)});
      var response = await Dio()
          .post('http://192.168.8.158:5000/pose_estimator', data: formdata);
      print(response);
      print("Avatar creation Finished");
      if (response != null) {
        // print("Heloooooooooooooooooooooooooooooooooooooooo");
      }
      // ios.add(response.data);
      // return jsonDecode(response.data);
    } catch (e) {
      print(e);
      print("catch....................................");
    }
    print(response);
    // await file.writeAsBytes(response);
    print("Outside");
    copyobj();
  }

  void copyobj() async {
    var client = SSHClient(
      host: backendip,
      port: 22,
      username: "sliit",
      passwordOrKey: "1994",
    );

    String result;
    try {
      result = await client.connect();
      if (result == "session_connected") {
        result = await client.execute(
            "sshpass -p 'Lucky' scp -r /home/sliit/VIBE/output/sample/meshes/0001/000000.obj 192.168.8.108:D:/Temp/research/ELEGANT-FRONTEND/assets/avatar/");
      }
      client.disconnect();
    } on PlatformException catch (e) {
      print('Error: ${e.code}\nError Message: ${e.message}');
    }
  }

  Widget get _imageDetectionView => SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: _selectImage,
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 130,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(210, 44, 9, 241),
                            Color.fromARGB(255, 181, 10, 224),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          (BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE),
                          ))
                        ]),
                    child: const Text(
                      'Open Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  if (fp == null) ...[
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_gictuerj.json',
                      height: 400,
                      width: 400,
                    ),
                  ]
                ],
              ),
              Container(

                  // child: Text(_selectImage),
                  ),
              GestureDetector(
                child: ClipRect(
                  child: CustomPaint(
                    child: _selectedImage,
                    foregroundPainter: PoseMaskPainter(
                      pose: _detectedPose,
                      mask: _maskImage,
                      imageSize: _imageSize,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        child: Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            child: Image.asset(
                              'assets/images/previous.png',
                              width: 50.0,
                              height: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: GestureDetector(
                        onTap: _detectImageBodyMask,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 140,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(210, 44, 9, 241),
                                  Color.fromARGB(255, 181, 10, 224),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                (BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE),
                                ))
                              ]),
                          child: const Text(
                            'Detect body mask',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: _detectImagePose,
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(210, 44, 9, 241),
                                  Color.fromARGB(255, 181, 10, 224),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                (BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE),
                                ))
                              ]),
                          child: const Text(
                            'Detect pose',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (fp != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                          onTap: () async {
                            // avatercreate();
                            Fluttertoast.showToast(
                                msg: "The avatar is getting created...",
                                timeInSecForIosWeb: 5,
                                fontSize: 15,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.lightBlue[300],
                                textColor: Colors.white);
                            setState(() => isLoadingspnr = true);
                            await Future.delayed(const Duration(seconds: 5));
                            setState(() => isLoadingspnr = false);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => msrnt('Male', 14, 34,
                                    34), //myshoulderwidth, myhip, myleglength
                                // previewav('Male', 14, 34, 34),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 60,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(210, 44, 9, 241),
                                    Color.fromARGB(255, 181, 10, 224),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  (BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE),
                                  ))
                                ]),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                // backgroundColor: Color.fromARGB(255, 181, 10, 224),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _cameraDetectionView => SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRect(
                child: CustomPaint(
                  child: _cameraImage,
                  foregroundPainter: PoseMaskPainter(
                    pose: _detectedPose,
                    mask: _maskImage,
                    imageSize: _imageSize,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: _toggleDetectPose,
                child: _isDetectingPose
                    ? const Text('Turn off pose detection')
                    : const Text('Turn on pose detection'),
              ),
              OutlinedButton(
                onPressed: _toggleDetectBodyMask,
                child: _isDetectingBodyMask
                    ? const Text('Turn off body mask detection')
                    : const Text('Turn on body mask detection'),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text("ELEGANT FIT ON",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 181, 10, 224))),
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Give it a try',
            ),
          ],
          currentIndex: _selectedTabIndex,
          onTap: _onTabSelectTapped,
        ),
        body: _selectedTab,
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

void isDesign() {
  if (fp != null) {
    child:
    Lottie.network(
      'https://assets10.lottiefiles.com/packages/lf20_gictuerj.json',
      height: 400,
      width: 400,
    );
  }
}
