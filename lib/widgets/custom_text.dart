import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final bool? isChanged;
  final String? number;

  const CustomText({
    super.key,
    this.isChanged,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      number ?? '$isChanged',
      // getText(),
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

// Kyska zholu = number ?? '$isChanged',
  String getText() {
    if (number != null) {
      return number!;
    } else {
      return isChanged.toString();
    }
  }
}
