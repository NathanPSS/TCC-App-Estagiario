import 'dart:typed_data';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/lifecycle_check_in.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/main.dart';
import 'package:hujb/providers/timer.dart';
import 'package:hujb/screens/NewHomeScreen.dart';
import 'package:hujb/screens/scanner.dart';
import 'package:hujb/screens/test_camera.dart';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:hujb/providers/is_in_checkInProvider.dart';




class ScannerScreen extends StatefulWidget {
   const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {


  @override
  Widget build(BuildContext context) {
     bool barcodeDetected = false;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
         // Container(decoration: BoxDecoration(color: Colors.red),),
      /*   Consumer( builder: (ctx,ref,child){
            return Container(
              width: 240,
              height: 300,
              child: MobileScanner(
                 overlay: Container(
                   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                 ),
                  controller: MobileScannerController(),
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
                ),
            );
          },
          ),
       */
         Scanner()
        ],
      ),
    );
  }
}
