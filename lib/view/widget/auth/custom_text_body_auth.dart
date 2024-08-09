import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String body;
  const CustomTextBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      alignment: Alignment.center,
      child: Text(
        body,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
