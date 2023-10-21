import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:hujb/providers/timer.dart';
import 'package:hujb/global/dimensions_device.dart';
import '../api/lifecycle_check_in.dart';




class StopwatchWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx,ref,child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time_rounded,
              color: (Theme.of(context).brightness == Brightness.light)
                  ? Colors.lightBlue[900]
                  : Colors.lightBlueAccent,
              size: getAverageDeviceSize(context: context) * 0.064,
            ),
            SizedBox(width: 10),
            Text("${ref.watch(timerController) ~/ 3600}:",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.lightBlue[900]
                      : Colors.lightBlueAccent,
                  fontSize: getAverageDeviceSize(context: context) * 0.036
              ),
            ),
            Text("${(ref.watch(timerController) % 3600) ~/ 60}:",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.lightBlue[900]
                      : Colors.lightBlueAccent,
                  fontSize: getAverageDeviceSize(context: context) * 0.036
              ),),
            Text("${ref.watch(timerController) % 60}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.lightBlue[900]
                      : Colors.lightBlueAccent,
                  fontSize: getAverageDeviceSize(context: context) * 0.036
              ),)
          ],
        ),
      );
    },);
  }
}
