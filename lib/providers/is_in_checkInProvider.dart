
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/lifecycle_check_in.dart';


final isCheckInOpenControler = FutureProvider<bool>((ref) async {
   return isCheckInOpen().then((value) {
    debugPrint(value.toString());
     return value;
   });
});

final stateCheckInController = StateNotifierProvider<CheckInNotifier,bool>((ref) {
  return ref.watch(isCheckInOpenControler).when(data: (data) {
    return CheckInNotifier(data);
  }, error: (error,stackTrace) { debugPrint(error.toString());  return CheckInNotifier(false);}, loading: () {debugPrint('loading'); return CheckInNotifier(true);});
});

class CheckInNotifier extends StateNotifier<bool> {
  CheckInNotifier(super._state);
}

