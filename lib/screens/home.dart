import 'package:flutter/cupertino.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/screens/base-dashboard.dart';
import 'package:hujb/screens/base.dart';
import 'package:hujb/widgets/icon_menu.dart';
import 'package:hujb/widgets/panel_services.dart';
import 'package:hujb/widgets/title_greetings.dart';
import 'package:hujb/widgets/title_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            TitleGreetings(),
         //   TitleServices(),
            PanelServices(),
          ],
        ),
      ]),
    );
  }
}
