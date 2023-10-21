import 'package:auto_size_text/auto_size_text.dart';

import 'package:hujb/ui_state_feedback/feedback_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/lifecycle_check_in.dart';
import 'package:flutter/material.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/providers/is_in_checkInProvider.dart';
import 'package:hujb/screens/NewHomeScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../ui_state_feedback/feedback_snackbar.dart';


class ConfirmationPanel extends StatefulWidget {
  const ConfirmationPanel({super.key});

  @override
  State<ConfirmationPanel> createState() => _ConfirmationPanelState();
}

class _ConfirmationPanelState extends State<ConfirmationPanel> {
  late final Future<Map<String, dynamic>?> data;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    data = closeCheckIn();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done) {
            Map<String, dynamic>? dataUI = snap.data!;
            return Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 24
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Setor",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize:
                                            getAverageDeviceSize(context: context) *
                                                0.04),
                              ),
                              Text("${dataUI['sectorName']}"),
                            ],
                          ),
                          Icon(
                            MdiIcons.hospitalBuilding,
                            color:
                                (Theme.of(context).brightness == Brightness.light)
                                    ? Colors.grey[800]
                                    : Colors.grey[400],
                            size: getAverageDeviceSize(context: context) * 0.056,
                          )
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nome",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontSize: getAverageDeviceSize(
                                                    context: context) *
                                                0.04)),
                                AutoSizeText(
                                  "nathan gonçalves de sousa".toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  stepGranularity: 12,
                                  minFontSize: 12,
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.person,
                              color:
                                  (Theme.of(context).brightness == Brightness.light)
                                      ? Colors.blue[800]
                                      : Colors.blueAccent[700],
                              size: getAverageDeviceSize(context: context) * 0.056)
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Abertura",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: getAverageDeviceSize(
                                                  context: context) *
                                              0.04)),
                              Text("${dataUI['hourOfOpen']}"),
                            ],
                          ),
                          Icon(Icons.input_rounded,
                              color:
                                  (Theme.of(context).brightness == Brightness.light)
                                      ? Colors.green[800]
                                      : Colors.greenAccent[400],
                              size: getAverageDeviceSize(context: context) * 0.056)
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fechamento",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: getAverageDeviceSize(
                                                  context: context) *
                                              0.04)),
                              Text("${dataUI['hourOfClose']}"),
                            ],
                          ),
                          Icon(Icons.output_rounded,
                              color:
                                  (Theme.of(context).brightness == Brightness.light)
                                      ? Colors.red[800]
                                      : Colors.redAccent,
                              size: getAverageDeviceSize(context: context) * 0.056)
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Duração",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: getAverageDeviceSize(
                                                  context: context) *
                                              0.04)),
                              Text("${dataUI['duration']}"),
                            ],
                          ),
                          Icon(Icons.timelapse_rounded,
                              color:
                                  (Theme.of(context).brightness == Brightness.light)
                                      ? Colors.indigo[800]
                                      : Colors.indigoAccent[400],
                              size: getAverageDeviceSize(context: context) * 0.056)
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Data",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: getAverageDeviceSize(
                                                  context: context) *
                                              0.04)),
                              Text("${dataUI['date']}"),
                            ],
                          ),
                          Icon(Icons.event,
                              color:
                                  (Theme.of(context).brightness == Brightness.light)
                                      ? Colors.pink[800]
                                      : Colors.pinkAccent[400],
                              size: getAverageDeviceSize(context: context) * 0.056)
                        ],
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Descrição",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize:
                                          getAverageDeviceSize(context: context) *
                                              0.04)),
                          Form(
                              child: SizedBox(
                            child: TextField(
                              maxLength: 500,
                              scrollPadding: EdgeInsets.only(bottom: 140),
                              controller: _controller,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline,
                            ),
                          )),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Consumer(builder: (ctx,ref,child) {
                         return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: () async {
                          await createRegistry(_controller.text);
                          ref.refresh(isCheckInOpenControler);
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>  NewHomeScreen(
                             snackBars: [SnackBar(content: Text("Check In Concluido"))],
                          )));
                          }, child: Padding(
                          padding: EdgeInsets.only(
                          left: 24,
                          right: 24
                          ),
                          child: Text("Confirmar",
                          style: TextStyle(
                          color: (Theme.of(context).brightness == Brightness.light) ? Colors.black : Colors.white,
                          ),
                          ),
                          )
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
