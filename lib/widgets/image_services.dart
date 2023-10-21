

import 'package:flutter/cupertino.dart';

class ImagesService extends StatelessWidget {
  const ImagesService({required this.pathImage,super.key});

  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 33,
      child: Image.asset(pathImage),
    );
  }
}