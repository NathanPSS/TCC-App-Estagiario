
import 'package:flutter/cupertino.dart';

class TextsService extends StatelessWidget {
  const TextsService({required this.textService,super.key});

  final String textService;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(textService),
    );
  }
}