import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/global/dimensions_device.dart';
import 'package:hujb/providers/timer.dart';
import 'package:hujb/screens/NewHomeScreen.dart';
import 'package:hujb/screens/confirmation_check_in.dart';
import 'package:hujb/screens/scanner_screen.dart';
import 'package:hujb/ui_state_feedback/feedback_snackbar.dart';
import 'package:hujb/widgets/base_services.dart';
import 'package:hujb/widgets/check-in-button.dart';
import 'package:hujb/widgets/check-out-button.dart';
import 'package:hujb/providers/is_in_checkInProvider.dart';


class PanelServices extends StatelessWidget {
  const PanelServices({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:
        MediaQuery.of(context).orientation == Orientation.portrait ? 32 : 20
        ),
        child: Column(
            children: [
              CheckButton(
                key: key,
              ),
              Container(
                  margin:  EdgeInsets.only(
                      top: 40,
                      left: getDeviceWith(context: context) * 0.04,
                  )
                  , child:
               MediaQuery.of(context).orientation == Orientation.portrait ?
              Column(
                  children: [
                    BaseServiceButton(nameButton: "Meus Estagios",iconButton: Icons.assignment),

                  ]) :
          Row(
          children: [
          BaseServiceButton(nameButton: "Meus Estagios",iconButton: Icons.assignment),
        ]))
            ],
          ),
      ),
    );

  }
}


class CheckButton extends ConsumerStatefulWidget {
  const CheckButton({super.key});

  @override
  ConsumerState<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends ConsumerState<CheckButton> {


  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (ctx, ref, child) {
          return ref.watch(isCheckInOpenControler).when(data: (data) {
            if (!data) {
              return Container(
                  alignment: Alignment.center,
                  child: CheckInButton(
                    onPressFunction: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const ScannerScreen()));
                    },
                  ));
            }
            return Container(
                alignment: Alignment.center,
                child: CheckOutButton(
                  onPressFunction: ()  {

                    ref.read(timerController.notifier).clear();
                    ref.refresh(timerController);
                    ref.refresh(isCheckInOpenControler);
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ConfirmationCheckInScreen()));
                  },
                ));
          },
              error: (error, stack) => Text('Error'),
              loading: () => CircularProgressIndicator());
        });
  }
}