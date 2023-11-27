

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/providers/registros.dart';

import '../global/dimensions_device.dart';

class RegistryDetails extends StatefulWidget{
  const RegistryDetails({super.key, required this.index ,required this.registries});
  final int index;

  final List<dynamic> registries;

  @override
  State<RegistryDetails> createState() => _RegistryDetailsState();
}

class _RegistryDetailsState extends State<RegistryDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Registro"),
          ),
          body: SizedBox(
            height: getDeviceHeight(context: context),
            child: Stack(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      widget.registries[widget.index]['nome']
                                          .toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      stepGranularity: 12,
                                      minFontSize: 12,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.person,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.blue[800]
                                      : Colors.blueAccent[700],
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
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
                                  Text(
                                      "${widget.registries[widget.index]['hr_entrada']}"),
                                ],
                              ),
                              Icon(Icons.input_rounded,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.green[800]
                                      : Colors.greenAccent[400],
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
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
                                  Text(
                                      "${widget.registries[widget.index]['hr_saida']}"),
                                ],
                              ),
                              Icon(Icons.output_rounded,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.red[800]
                                      : Colors.redAccent,
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
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
                                  Text("${widget.registries[widget.index]['tempo']}"),
                                ],
                              ),
                              Icon(Icons.timelapse_rounded,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.indigo[800]
                                      : Colors.indigoAccent[400],
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
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
                                  Text("${widget.registries[widget.index]['date']}"),
                                ],
                              ),
                              Icon(Icons.event,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.pink[800]
                                      : Colors.pinkAccent[400],
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                          fontSize: getAverageDeviceSize(
                                              context: context) *
                                              0.04)),
                                  Text("${widget.registries[widget.index]['status']}"),
                                ],
                              ),
                              Icon(Icons.event,
                                  color: (Theme.of(context).brightness ==
                                      Brightness.light)
                                      ? Colors.pink[800]
                                      : Colors.pinkAccent[400],
                                  size: getAverageDeviceSize(context: context) *
                                      0.056)
                            ],
                          ),
                          SizedBox(height: 24),

                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Descrição",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                        fontSize: getAverageDeviceSize(
                                            context: context) *
                                            0.04)),
                                Text("${widget.registries[widget.index]['descricao']}")
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getDeviceHeight(context: context) * 0.04,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}