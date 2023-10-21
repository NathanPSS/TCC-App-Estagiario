
import 'package:flutter/material.dart';

import '../global/dimensions_device.dart';
import 'confirm-button.dart';
import 'content-checks-panel.dart';
import 'deny-button.dart';

class CheckOutPanel extends StatelessWidget {
  const CheckOutPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: getDeviceHeight(context: context) * 0.20,
        height: getDeviceHeight(context: context) * 0.75,
        width: getDeviceWith(context: context) * 0.80,
        left: getDeviceWith(context: context) * 0.1,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 4,
                    blurStyle: BlurStyle.normal,
                    offset: const Offset(5, 5))
              ],
              color: const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  "Check-Out",
                  style: TextStyle(
                      fontSize: getDeviceWith(context: context) * 0.11),
                )),
            Container(
              alignment: Alignment.topLeft,
              width: getDeviceWith(context: context) * 0.80,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children:  [
                  const  ContentChecksPanel(
                      title: "Setor", content: "001 - Pediatria"),
                  const  ContentChecksPanel(
                      title: "Data e Hora", content: "02/04/2023 - 14:22"),
                  const   ContentChecksPanel(
                      title: "Aluno(a)", content: "Nathan Pereira Sarmento"),
                  const   ContentChecksPanel(
                      title: "Horário Inicio", content: "13:00"),
                  const   ContentChecksPanel(
                      title: "Horário Termino", content: "17:00"),
                  Container(
                    margin: EdgeInsets.only(top: getDeviceHeight(context: context) * 0.05),
                    child: Row(
                      children: [ConfirmButton(),SizedBox(width: getDeviceWith(context: context) * 0.32,), DenyButton()],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}