import 'package:elegant_fit_on/components/size_config.dart';
import 'package:flutter/material.dart';

import '../../3DAvatar/instruct.dart';

class StartAvatar extends StatelessWidget {
  const StartAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      
      onTap: () {
         
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => categories[index]["press"],
              //   ),
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => VoicePage(),
              //   ),
              // );
              showDialog(
                context: context,
                builder: (BuildContext context) => instruct(),
              );
            
      },
      child: Column(
        children: [
          // ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //           // The width will be 100% of the parent widget
          //           // The height will be 60
          //           minimumSize: const Size.fromHeight(60)),
          //       onPressed: () {},
          //       icon: const Icon(Icons.run_circle),
          //       child: const Text('Elevated Button')),

                  ElevatedButton.icon(
                style: OutlinedButton.styleFrom(
                    // the height is 50, the width is full
                    minimumSize: const Size.fromHeight(70)),
                onPressed: () {   showDialog(
                context: context,
                builder: (BuildContext context) => instruct(),
              );},
                icon: const Icon(Icons.stacked_line_chart_sharp,size: 40,),
                label: const Text('Start the JOURNEY', style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),)),
            const SizedBox(height: 40),
            // OutlinedButton.icon(
            //     style: OutlinedButton.styleFrom(
            //         // the height is 50, the width is full
            //         minimumSize: const Size.fromHeight(50)),
            //     onPressed: () {},
            //     icon: const Icon(Icons.run_circle),
            //     label: const Text('Outlined Button')),
          // Container(
            
          //   // alignment: Alignment.center,
          //   // height: 90,
          //   width: double.infinity,
          //   margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenWidth(20),
          //     vertical: getProportionateScreenWidth(15),
          //   ),
            
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [
          //         Color.fromARGB(210, 44, 9, 241),
          //         Color.fromARGB(255, 181, 10, 224),
          //       ],
          //       begin: Alignment.centerLeft,
          //       end: Alignment.centerRight,
          //     ),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Text.rich(
          //     TextSpan(
          //       style: TextStyle(color: Color.fromARGB(253, 255, 255, 255)),
          //       children: [
          //         TextSpan(text: "A Summer Surpise\n"),
          //         TextSpan(
          //           text: "Cashback 20%",
          //           style: TextStyle(
          //             fontSize: getProportionateScreenWidth(24),
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
