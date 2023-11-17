import 'package:flutter/material.dart';

class CardDataWidget extends StatelessWidget {
  const CardDataWidget({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(text1),
          Text(
            text2,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    ));
  }
}
