import 'package:flutter/cupertino.dart';
import 'package:hujb/screens/base.dart';

import '../widgets/gradient_container.dart';

class BaseDashBoard extends StatelessWidget {
  const BaseDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
        child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.15,
            alignment: Alignment.topCenter,
            child: GradientContainer()));
  }
}
