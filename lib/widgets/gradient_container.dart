

import 'package:flutter/material.dart';
import 'package:hujb/global/colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
         stops: [0,0.2,0.4,1],
            end: Alignment.bottomCenter,
            colors: [GlobalColors.primaryColor,GlobalColors.colorGradientSecondary,GlobalColors.secondaryColor,GlobalColors.thirdColor]
        ),
      ),
    );
  }

}