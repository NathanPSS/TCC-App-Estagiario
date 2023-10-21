
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,

      child: ElevatedButton(
         style: ElevatedButton.styleFrom(

         ),
          onPressed: () {}, child: Icon(Icons.check, size: 50)),
    );

    /*   Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/confirm.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: RawMaterialButton(
              shape: CircleBorder(),
              splashColor: Colors.blueAccent.withOpacity(0.5),
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
// Container(width: 60,height: 60,child: FittedBox(fit:BoxFit.cover,child: Image.asset("assets/confirm.png"))));
