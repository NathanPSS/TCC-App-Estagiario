import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/config/brightness_mode.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/providers/snackbars.dart';
import 'package:hujb/screens/config.dart';
import 'package:hujb/ui_state_feedback/feedback_snackbar.dart';
import 'package:hujb/widgets/panel_services.dart';
import 'package:hujb/widgets/switch_mode.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class NewHomeScreen extends ConsumerStatefulWidget {
  NewHomeScreen({super.key,this.snackBars});

  List<SnackBar>? snackBars;

  @override
  ConsumerState<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends ConsumerState<NewHomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(widget.snackBars != null){
      showOkSnackBars(context: context, snackBars: widget.snackBars!);
      widget.snackBars = [];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   // ref.watch(snackBarsController.notifier).consume(context);
    return Scaffold(
      onDrawerChanged: (value) => print(value),
      drawer: Drawer(
          child: FutureBuilder(
            future: getThemeMode(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                      children:[
                        SizedBox(height: 200),
                        Container(
                          padding: EdgeInsets.all(getAverageDeviceSize(context: context) * 0.064),
                      //    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConfigScreen()));
                            },
                    //    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.settings,size: getAverageDeviceSize(context: context) * 0.064,),
                                  SizedBox(width: 32),
                                  Text("Configurações",style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                      fontSize:
                                      getAverageDeviceSize(context: context) *
                                          0.032)),
                                ],
                              ),
                            ),
                      ),
                        ),
              ]
                    );
                }
                return Center(
                  child: LoadingAnimationWidget.waveDots(color: Colors.white, size: 30),
                );
            },
          ),
      ),
      body:   SafeArea(child: PanelServices()));
  }
}
