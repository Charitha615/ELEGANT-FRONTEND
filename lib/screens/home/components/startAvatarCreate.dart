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
        showDialog(
          context: context,
          builder: (BuildContext context) => instruct(),
        );
      },
      child: Column(
        children: [
          ElevatedButton.icon(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.grey[500],
                  minimumSize: const Size.fromHeight(70)),
              onPressed: () {},
              icon: const Icon(
                Icons.stacked_line_chart_sharp,
                size: 0,
              ),
              label: const Text(
                'A Summer Surpise Cashback 20%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
