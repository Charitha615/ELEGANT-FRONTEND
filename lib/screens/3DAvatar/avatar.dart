import 'dart:io';
import 'dart:typed_data';
import 'package:elegant_fit_on/screens/3DAvatar/lib/body_detection.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/body_mask.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/image_result.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/models/pose.dart';
import 'package:elegant_fit_on/screens/3DAvatar/lib/png_image.dart';
import 'package:elegant_fit_on/screens/3DAvatar/pose_mask_painter.dart';
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

void main() {
  runApp(const Avatar());
}

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  int _selectedTabIndex = 0;
  String backendip = "192.168.8.158";
  bool _isDetectingPose = false;
  bool _isDetectingBodyMask = false;
  var fp;
  Image? _selectedImage;
  Pose? _detectedPose;
  ui.Image? _maskImage;
  Image? _cameraImage;
  Size _imageSize = Size.zero;

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
    String path = fp.toString();
    String? newqqq = path.split(":").last;
    String ello = newqqq.substring(2, newqqq.length - 1);

    try {
      print(fp);
      var formdata =
          FormData.fromMap({"image": await MultipartFile.fromFile(ello)});
      var response = await Dio()
          .post('http://192.168.8.158:5000/pose_estimator', data: formdata);
      print(response);
      print("Avatar creation Finished");
      if (response != null) {
        // print("Heloooooooooooooooooooooooooooooooooooooooo");
      }
    } catch (e) {
      print(e);
      print("catch....................................");
    }
  }

  Widget get _imageDetectionView => SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: OutlinedButton(
                  onPressed: _selectImage,
                  child: const Text('Select image'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
              Container(
                child: Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_gictuerj.json',
                  height: 400,
                  width: 400,
                ),
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
                      child: OutlinedButton(
                        onPressed: _detectImageBodyMask,
                        child: const Text('Detect body mask'),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: OutlinedButton(
                        onPressed: _detectImagePose,
                        child: const Text('Detect pose'),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => msrnt('Male', 14, 34,
                                  34), //myshoulderwidth, myhip, myleglength
                              // builder: (context) =>  sitems('Male', 16, 32, 32),//myshoulderwidth, myhip, myleglength
                              // builder: (context) =>  sitems('Male', 14, 34, 34),//myshoulderwidth, myhip, myleglength
                              // builder: (context) =>  sitems('Male', 20, 36, 36),//myshoulderwidth, myhip, myleglength
                              // builder: (context) =>  sitems('Female', 14, 32, 32),//myshoulderwidth, myhip, myleglength
                            ),
                          );
                        },
                        child: const Text('Next'),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ),
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
          title: const Text('Body Detection Plugin Example App'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
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
