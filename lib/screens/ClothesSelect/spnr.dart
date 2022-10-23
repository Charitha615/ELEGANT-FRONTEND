import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spnr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // insetPadding: EdgeInsets.all(10),
      body: Center(
        child: SpinKitCircle(
            size: 140,
            // duration: const Duration(seconds: 2),
            itemBuilder: (context, index) {
              final colors = [
                Color.fromARGB(255, 220, 84, 254),
                Color.fromRGBO(36, 110, 233, 1),
              ];
              final color = colors[index % colors.length];
              return DecoratedBox(
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              );
            }),
      ),
    );
    // throw UnimplementedError();
  }
}
