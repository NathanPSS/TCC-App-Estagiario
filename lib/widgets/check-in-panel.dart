import 'package:flutter/material.dart';
import 'package:hujb/widgets/confirm-button.dart';
import 'package:hujb/widgets/content-checks-panel.dart';
import 'package:hujb/widgets/deny-button.dart';

import '../global/dimensions_device.dart';

class CheckInPanel extends StatelessWidget {
  const CheckInPanel({super.key});

  @override
  Widget build(BuildContext context) {


     return Container(
              width: double.infinity,
                  padding: EdgeInsets.all(30),
                  child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                      const  ContentChecksPanel(
                            title: "Setor", content: "001 - Pediatria"),
                      const  ContentChecksPanel(
                            title: "Data e Hora", content: "02/04/2023 - 14:22"),
                     const   ContentChecksPanel(
                            title: "Aluno(a)", content: "Nathan Pereira Sarmento"),
                        Container(
                          margin: EdgeInsets.only(top: getDeviceHeight(context: context) * 0.1625),
                          child: Row(
                            children: [DenyButton(),SizedBox(width: getDeviceWith(context: context) * 0.32,), ConfirmButton()],
                          ),
                        ),
                      ],
                    ),
              );
  }
}
