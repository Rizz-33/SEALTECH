import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16)
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}