import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/ui_state_feedback/feedback_snackbar.dart';


final snackBarsController = StateNotifierProvider<SnackBarsApp,List<SnackBar>>((ref) {
     return SnackBarsApp([]);
}
);

class SnackBarsApp extends StateNotifier<List<SnackBar>>{
  SnackBarsApp(super._state);


  void add(SnackBar snackBar){
   state = [...state,snackBar];
  }

  void clean() {
    state = [];
  }
}