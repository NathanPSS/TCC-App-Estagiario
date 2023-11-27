

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/widgets/timer.dart';

class DashBoard extends ConsumerStatefulWidget {

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
   return _DashBoardState();
  }
}

class _DashBoardState extends ConsumerState<DashBoard> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.blueGrey[400],
              onPressed: (){},
              child: Icon(
                Icons.access_time_rounded,
                color: Colors.white,
              ),
            ),
            StopwatchWidget()
          ],
        ),
    );
  }
}