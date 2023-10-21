

import 'package:flutter/material.dart';

import '../global/dimensions_device.dart';

class ContentChecksPanel extends StatelessWidget {
  const ContentChecksPanel({required this.title, required this.content,super.key});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: getDeviceHeight(context: context) * 0.025),
      child: Column(
        children: [
          Container(
            margin:const EdgeInsets.only(bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text(title,
              style: TextStyle(
                  fontSize: getDeviceWith(context: context) * 0.07),
            ),
          ),
          Container(alignment: Alignment.centerLeft,child: Text(content,style: TextStyle(fontSize: getDeviceWith(context: context) * 0.041,color: const Color.fromARGB(255, 67, 67, 67)),)),
        ],
      ),
    );
  }
}