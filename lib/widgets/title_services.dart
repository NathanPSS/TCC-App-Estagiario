import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hujb/global/dimensions_device.dart';

class TitleServices extends StatelessWidget {
  const TitleServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: getDeviceWith(context: context),
      top: getDeviceHeight(context: context) * 0.15,
      height: getDeviceHeight(context: context) * 0.05,
      child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(4, 181, 192, 0.75),
              border: Border(
              top: BorderSide(color: Color.fromRGBO(0, 148, 255, 1.0), width: 2),
              bottom: BorderSide(color: Color.fromRGBO(0, 148, 255, 1.0), width: 2)
              ),
    ),
          child: const Text(
            "Serviços",
            style: TextStyle(color: Colors.white, fontSize: 23),
            textAlign: TextAlign.center,
          )),
    );
  }
}
