import 'package:flutter/material.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckInButton extends StatelessWidget {
  const CheckInButton({required this.onPressFunction, super.key});

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
        onPressed: onPressFunction,
        child:  MediaQuery.of(context).orientation == Orientation.portrait ?
        Column(
          children: [
            Expanded(
                flex: 2,
                child: Icon(
                  MdiIcons.bookOpenPageVariantOutline,
                  color: (Theme.of(context).brightness == Brightness.light) ? Colors.green[800] : Colors.greenAccent,
                  size: getAverageDeviceSize(context: context) * 0.24,

                )),
            Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Check-In",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 30
                      ),
                    ))),
          ],
        ) :
        Padding(
          padding:  EdgeInsets.only(left: getDeviceWith(context: context) * 0.04),
          child: Row(
            children: [
              Icon(
                    MdiIcons.bookOpenPageVariantOutline,
                    color: (Theme.of(context).brightness == Brightness.light) ? Colors.green[800] : Colors.greenAccent,
                    size: getAverageDeviceSize(context: context) * 0.2,

                  ),
               SizedBox(width: getDeviceWith(context: context) * 0.04),
               Text(
                        "Check-In",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 30
                        ),
                      ),
            ],
          ),
        ),
        ),

    );
  }
}
