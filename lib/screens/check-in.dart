
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hujb/global/colors.dart';
import 'package:hujb/widgets/check-in-panel.dart';

import '../global/dimensions_device.dart';
import '../widgets/icon_menu.dart';
import 'base-dashboard.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
         title: Text('Check-In'),
       ),
      body: CheckInPanel(),
    );
  }
  }
