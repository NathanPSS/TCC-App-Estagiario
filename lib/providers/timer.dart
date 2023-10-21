import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hujb/api/lifecycle_check_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Future<int> setInitialTime() async{
  var createdAt = DateTime.parse(await getCheckInCurrentTime());
  var initalTimerTimer = DateTime.now().difference(createdAt).inSeconds;
  return initalTimerTimer;
}

final currentTimeCheckInProvider = FutureProvider<int>((ref) async {
  return await setInitialTime();
});

final timerController = StateNotifierProvider<StopwatchNotifier,int>((ref) {
  final initialTime = ref.watch(currentTimeCheckInProvider).when(
      data: (data)  {
        final stopwatch = StopwatchNotifier(data);
        stopwatch.start();
        return stopwatch;
},
    loading: () => StopwatchNotifier(0),
    error: (error, stackTrace) => StopwatchNotifier(0));
  return initialTime;
});

class StopwatchNotifier extends StateNotifier<int> {
  StopwatchNotifier(super._state);

  Timer? _timer;
  bool _isRunning = false;


  void start() {
    _isRunning = true;
    if(_timer != null){
      return;
    }
    _timer = Timer.periodic(Duration(seconds: 1), _updateTimer);
  }

  void stop() {
    _isRunning = false;
    _timer?.cancel();
  }

  void clear(){
    _isRunning = false;
    _timer?.cancel();
  }

  void stopReset(){
    _isRunning = false;
    state=0;
  }

  void reset() {
    _isRunning = false;
    state = 0;
  }

  void _updateTimer(Timer timer) {
    if (_isRunning) {
      state++;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
