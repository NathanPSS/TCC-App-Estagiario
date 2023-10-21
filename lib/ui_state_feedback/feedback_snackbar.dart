import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




void showOkSnackBars({required BuildContext context,required List<SnackBar> snackBars}) {
  snackBars.forEach((element) async {
   print(element);
   ScaffoldMessenger.of(context).showSnackBar(
     element
   );
   await Future.delayed(const Duration(seconds: 3));
   return;
 });

}