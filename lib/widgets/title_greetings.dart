import 'package:flutter/material.dart';
import 'package:hujb/global/dimensions_device.dart';

class TitleGreetings extends StatelessWidget {
  const TitleGreetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getDeviceHeight(context: context) *0.01,
        height: getDeviceHeight(context: context) *0.2,
        width: getDeviceWith(context: context) * 0.70,
        left: getDeviceWith(context: context) * 0.25,
        child: const FittedBox(
          fit: BoxFit.contain,
      child: Text(
        "Bem Vindo(a), Nathan",textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    ));
  }
}
