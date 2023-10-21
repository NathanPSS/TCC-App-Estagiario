import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/lifecycle_check_in.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/providers/is_in_checkInProvider.dart';
import 'package:hujb/providers/timer.dart';
import 'package:hujb/screens/NewHomeScreen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:hujb/screens/QRscannerOverlay.dart';


class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController  cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    _screenWasClosed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool barcodeDetected = false;
    return Scaffold(

      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [

          Consumer(builder: (ctx,ref,child) {
            final screenSize = MediaQuery.of(ctx).size;
          return  MobileScanner(
            scanWindow: Rect.fromCenter(
                center: Offset(screenSize.width / 2, screenSize.height / 2),
                width: (screenSize.width < 400 || screenSize.height < 400) ? 270.0 : 400.0,
                height: (screenSize.width < 400 || screenSize.height < 400) ? 270.0 : 400.0,
            ),
              controller: cameraController,
              onDetect: (capture) async {
                if (!barcodeDetected) {
                  barcodeDetected = true;
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;
                  debugPrint('Barcode found! ${barcodes[0].rawValue}');
                  await openCheckIn(json.decode(barcodes[0].rawValue!));
                  ref.refresh(isCheckInOpenControler);
                  ref.refresh(currentTimeCheckInProvider);
                  Navigator.of(context).pop(
                    MaterialPageRoute(builder: (ctx) {
                      ref.read(timerController.notifier).start();
                      return  NewHomeScreen();
                    }),
                  );
                }
              },
            );
          }),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
          Container(
            margin: MediaQuery.of(context).orientation == Orientation.portrait ?
            EdgeInsets.only(
              top: getDeviceHeight(context: context) * 0.25,
              left: getDeviceWith(context: context) * 0.1
            ) :
            EdgeInsets.only(
                top: getDeviceHeight(context: context) * 0.05,
                left: getDeviceHeight(context: context) * 0.6
            )
            ,
            child: Text("Aponte a camera do celular \n para o QR code", style:
            Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                color: Colors.white,
                fontSize:
                getAverageDeviceSize(context: context) *
                    0.04),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      )
    );
  }

  void _screenWasClosed(){
    _screenOpened = false;
  }
}