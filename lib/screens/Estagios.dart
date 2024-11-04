
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/registries.dart';
import 'package:hujb/providers/registros.dart';
import 'package:hujb/widgets/registries.dart';

class EstagiosScreen extends StatefulWidget{
  const EstagiosScreen({super.key});

  @override
  State<EstagiosScreen> createState() => _EstagiosScreenState();
}
enum RegistroTypes {
  registrosSemAssinaturas,
  registroAssinados,
  registroRejeitados
}

class _EstagiosScreenState extends State<EstagiosScreen> {

  Map<String,bool> visibility = {
    RegistroTypes.registrosSemAssinaturas.name: true,
    RegistroTypes.registroAssinados.name: true,
    RegistroTypes.registroRejeitados.name: true
  };

  void refresh(){
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
   List<dynamic> columChildreen = [];
   return Scaffold(
     appBar: AppBar(
       title: Text("Estagios"),
       actions: [
       PopupMenuButton(
           icon: Icon(Icons.filter_list),
           itemBuilder: (ctx) => [
       PopupMenuItem(
         enabled: false,
           child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
             return Row(
               children: [
                 Checkbox(value: visibility[RegistroTypes.registrosSemAssinaturas.name]!, onChanged: (bool? value) {
                   setState(() {
                     debugPrint(value.toString());
                     visibility[RegistroTypes.registrosSemAssinaturas.name] = value!;
                     refresh();
                   });
                   reassemble();
                 },shape: CircleBorder()),
                 Text("Registros sem Assinatura",style: TextStyle(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black),),
               ],
             );
           },)
       ),
             PopupMenuItem(
                 enabled: false,
                 child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                   return Row(
                     children: [
                       Checkbox(value: visibility[RegistroTypes.registroAssinados.name]!, onChanged: (bool? value) {
                         setState(() {
                           debugPrint(value.toString());
                           visibility[RegistroTypes.registroAssinados.name] = value!;
                           refresh();
                         });
                         reassemble();
                       },shape: CircleBorder()),
                       Text("Registros Assinados",style: TextStyle(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black),),
                     ],
                   );
                 },)
             ),
             PopupMenuItem(
                 enabled: false,
                 child: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                   return Row(
                     children: [
                       Checkbox(value: visibility[RegistroTypes.registroRejeitados.name]!, onChanged: (bool? value) {
                         setState(() {
                           debugPrint(value.toString());
                           visibility[RegistroTypes.registroRejeitados.name] = value!;
                           refresh();
                         });
                         reassemble();
                       },shape: CircleBorder()),
                       Text("Registros Invalidados",style: TextStyle(color: (Theme.of(context).brightness == Brightness.dark) ? Colors.white : Colors.black),),
                     ],
                   );
                 },)
             )
       ])
       ]
     ),
     body: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
       var data = ref.watch(allRegistryStateController);
       if(data != null) {
           if (visibility[RegistroTypes.registrosSemAssinaturas.name]!) {
             columChildreen.addAll(data[RegistroTypes.registrosSemAssinaturas.name].map((e) {
               e['status'] = 'PENDENTE';
               return e;
             }));
           }
           if (visibility[RegistroTypes.registroAssinados.name]!) {
             columChildreen.addAll(data[RegistroTypes.registroAssinados.name].map((e) {
               e['status'] = 'ASSINADO';
               return e;
             }));
           }
           if (visibility[RegistroTypes.registroRejeitados.name]!) {
             columChildreen.addAll(data[RegistroTypes.registroRejeitados.name].map((e) {
               e['status'] = 'INVALIDADO';
               return e;
             }));
           }
           if(columChildreen.isEmpty){
             return Center(child: Text('Sem Estágios'));
           }
             return Center(
                 child: Registry(data: columChildreen)
             );
         }
         return Center(
           child: CircularProgressIndicator(),
         );
       },
     )
    );
  }
}