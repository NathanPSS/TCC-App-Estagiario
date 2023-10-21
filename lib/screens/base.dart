import 'package:flutter/material.dart';
import 'package:hujb/global/colors.dart';
import 'package:hujb/widgets/gradient_container.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({this.child,super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: GlobalColors.backGroundBaseScreenColor),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.height,
     child: child,
    );
  }
}
//child: const FractionallySizedBox(
//widthFactor: 1,
//heightFactor: 0.15,
//alignment: Alignment.topCenter,
//child: GradientContainer(),