

import 'package:flutter/material.dart';

class DenyButton extends StatelessWidget {
  const DenyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,

      child: ElevatedButton(
          style: ElevatedButton.styleFrom(

          ),
          onPressed: () {}, child: Icon(Icons.clear, size: 50)),
    );


    /* Stack(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration:const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/cancel.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: RawMaterialButton(
              shape: CircleBorder(),
              splashColor: Colors.deepPurpleAccent.withOpacity(0.5),
              onPressed: () {
                print(211);
              },
              child: Text("")
          ),
        ),
      ],
    ); */

  }
}