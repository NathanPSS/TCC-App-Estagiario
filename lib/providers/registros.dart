
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/api/registries.dart';


final allRegistriesControler = FutureProvider<Map<String,dynamic>?>((ref) async {
  return getAllRegistries().then((value) {
    return value;
  });
});

final allRegistryStateController = StateNotifierProvider<RegistriesNotifier,Map<String,dynamic>?>((ref) {
  return ref.watch(allRegistriesControler).when(data: (data) {
    return RegistriesNotifier(data);
  }, error: (error,stackTrace) { debugPrint(error.toString());  return RegistriesNotifier(null);}, loading: () {debugPrint('loading'); return RegistriesNotifier(null);});
});

class RegistriesNotifier extends StateNotifier<Map<String,dynamic>?> {
  RegistriesNotifier(super._state);

  getState(){
    return state;
  }
}