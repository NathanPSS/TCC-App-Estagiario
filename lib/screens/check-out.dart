
import 'package:flutter/cupertino.dart';

import '../global/dimensions_device.dart';
import '../widgets/check-out-panel.dart';
import '../widgets/icon_menu.dart';
import 'base-dashboard.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
      width: getDeviceWith(context: context),
      height: getDeviceHeight(context: context),
      child: Column(children: [
        Stack(
          children: const [
            BaseDashBoard(),
            IconMenu(),
            CheckOutPanel()
          ],
        ),
      ]),
    );
  }
}