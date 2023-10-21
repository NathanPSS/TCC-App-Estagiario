import 'package:flutter/material.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/widgets/timer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({required this.onPressFunction,super.key});


  final void Function() onPressFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWith(context: context) * 0.8,
      height: getDeviceHeight(context: context) * 0.35,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        onPressed:onPressFunction,
        child: MediaQuery.of(context).orientation == Orientation.portrait ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Icon(
                  MdiIcons.bookOutline,
                  color: (Theme.of(context).brightness == Brightness.light) ? Colors.red[800] : Colors.redAccent[400],
                  size: getAverageDeviceSize(context: context) * 0.24,
                )),
            SizedBox(height: getDeviceHeight(context: context) * 0.1),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                        child: Text(
                          "Check-Out",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 30
                          ),
                        )),
                     StopwatchWidget()
                  ],
                )),
          ],
        ) :
        Padding(
          padding:  EdgeInsets.only(left: getDeviceWith(context: context) * 0.04),
          child: Row(
            children: [
              Icon(
                MdiIcons.bookOutline,
                color: (Theme.of(context).brightness == Brightness.light) ? Colors.red[800] : Colors.redAccent[400],
                size: getAverageDeviceSize(context: context) * 0.2,

              ),
              SizedBox(width: getDeviceWith(context: context) * 0.04),
              Text(
                "Check-Out",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 30
                ),
              ),
              SizedBox(width: 40),
              StopwatchWidget()
            ],
          ),
        ),
      ),
    );
  }
}
