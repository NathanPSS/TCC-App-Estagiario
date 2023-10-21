import 'package:flutter/material.dart';
import 'package:hujb/global/colors.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/widgets/image_services.dart';
import 'package:hujb/widgets/text_services.dart';

/* class BaseService extends StatelessWidget {
  const BaseService(
      {required this.textService, required this.pathImage, super.key});

  final String textService;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width * 0.2;
    final double containerHeight = MediaQuery.of(context).size.height * 0.09;
    return Container(
      width: containerWidth,
      height: containerHeight,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(color: Color.fromARGB(255, 187, 187, 187), width: 1),
          bottom: BorderSide(color: Color.fromARGB(255, 187, 187, 187), width: 1),
          left: BorderSide(color: Color.fromARGB(255, 187, 187, 187), width: 1),
          right: BorderSide(color: Color.fromARGB(255, 187, 187, 187), width: 1),
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.25),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(5, 5),
              blurStyle: BlurStyle.normal)
        ],
      ),
      child: Column(
        children: [
          SizedBox(width: containerWidth * 0.4,height: containerHeight * 0.5,child: ImagesService(pathImage: pathImage),),
          SizedBox(width: containerWidth * 0.5,height: containerHeight * 0.2,child: TextsService(textService: textService),)
        ],
      ),
    );
  }
}
*/

/* class BaseServiceButton extends StatelessWidget {
  const BaseServiceButton(
      {required this.imagePath, required this.text, super.key});

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25))]),
        margin: EdgeInsets.only(right: 15, left: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
            onPressed: () => {print(2)},
            style: ElevatedButton.styleFrom(

              elevation: 10,
              foregroundColor: Colors.grey,
              shadowColor: Colors.black,
              side: const BorderSide(
                  color: Color.fromARGB(255, 187, 187, 187), width: 1),
              backgroundColor: GlobalColors.servicesButtons,
            ),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  imagePath,
                ),
              ),
              Expanded(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    text,
                    style: TextStyle(color: GlobalColors.servicesButtonsText),
                  ),
                ),
              ),

              //    FittedBox(
              //         fit: BoxFit.contain,
              //         child: Text(
              //           text,
              //         style: TextStyle(
              //         color: GlobalColors.servicesButtonsText)))
              //     child: FittedBox(
              //     fit: BoxFit.contain,
              //     child: Text(
              //     text,
              //        style: TextStyle(
              //      color: GlobalColors.servicesButtonsText)))
            ]),
          ),
        )
        //     ),
        );
  }
} */

class BaseServiceButton extends StatelessWidget {
  const BaseServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).orientation == Orientation.portrait ? getDeviceWith(context: context) * 0.8 : getDeviceWith(context: context) * 0.4,
      height: MediaQuery.of(context).orientation == Orientation.portrait ? getDeviceHeight(context: context) * 0.08 : getDeviceHeight(context: context) * 0.16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        onPressed: () {

        },
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.assignment_ind_outlined,
                      size: 40,
                      color: (Theme.of(context).brightness == Brightness.light) ? Colors.blue[800] : Colors.blueAccent,
                    ))),
            Expanded(
                flex: 4,
                child: Container(
                    height: MediaQuery.of(context).orientation == Orientation.portrait ? getDeviceWith(context: context) * 0.08 : getDeviceWith(context: context) * 0.04,
                    //       decoration: BoxDecoration(color: Colors.black),
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.contain,
                      child: Text("Historico",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith()),
                    ))),
          ],
        ),
      ),
    );
  }
}
