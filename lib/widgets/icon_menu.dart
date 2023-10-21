import 'package:flutter/cupertino.dart';
import 'package:hujb/global/dimensions_device.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({super.key});

  @override
  Widget build(BuildContext context) {
   /* return Positioned(
        top: getDeviceHeight(context: context) *0.13,
      //  left: getDeviceWith(context: context) * 0.01,
        width: getDeviceWith(context: context) *0.1,
        height: getDeviceHeight(context: context) *0.06,
        child: Image.asset("assets/menu-aberto.png"));
    */
    return Positioned(
          top: getDeviceHeight(context: context) *0.08,
          left: getDeviceWith(context: context) * 0.06,
          width: getDeviceWith(context: context) *0.1,
          height: getDeviceHeight(context: context) *0.06,
          child: GestureDetector(
            onTap: () => {print(20)},
            child: Image.asset("assets/menu-aberto.png"),
          ));
  }
}
