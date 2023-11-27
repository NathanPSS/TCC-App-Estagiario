

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hujb/screens/registry_details.dart';

class Registry extends StatefulWidget{
  const Registry({super.key,required this.data});

  final  List<dynamic> data;

  @override
  State<Registry> createState() => _RegistryState();
}

class _RegistryState extends State<Registry> {
  @override
  Widget build(BuildContext context) {
   return ListView.builder(
       shrinkWrap: true,
       itemCount: widget.data.length,
       itemBuilder: (BuildContext context, int index) {
         return SizedBox(
           height: 120,
           child: InkWell(
             onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RegistryDetails(index: index,registries: widget.data,)));
             },
             child: Container(
               decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: (Theme.of(context).brightness == Brightness.light) ? Colors.black45 : Colors.white24))),
               padding:const EdgeInsets.all(16),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   AutoSizeText(
                     'Nome: ${widget.data[index]['nome'].toUpperCase()}',
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     stepGranularity: 12,
                     minFontSize: 12,
                   ),
                   Text('Data: ${widget.data[index]['data']}'),
                   Text('Duração: ${widget.data[index]['tempo']}'),
                   Text('Status: ${widget.data[index]['status']}'),
                 ],
               ),
             ),
           ),
         );
       },
   );
  }
}