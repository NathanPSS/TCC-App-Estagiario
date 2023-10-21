
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hujb/widgets/confirmation_panel.dart';

class ConfirmationCheckInScreen extends StatelessWidget{
  const ConfirmationCheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
      await showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
            title: Text('Confirmação de Check Out'),
            content: Text('Conclua seu CheckOut primeiro para retornar ao Dashboard'),
           );
      }
      );
      return false;
      },
      child: Scaffold(
        appBar: AppBar(
         automaticallyImplyLeading: false,
          title: Text('Confirmação de CheckOut'),
        ),
        body: ConfirmationPanel()
        ),
    );
  }
}