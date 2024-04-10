import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode ? focusNode;

  const CustomTextField({Key? key, required this.hintText, required this.obscureText, required this.controller, this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
              cursorColor: accent75,
              decoration: InputDecoration(
                hintText: 'Message SEALTECH...',
                filled: true,
                fillColor: secondaryColor,
                contentPadding: const EdgeInsets.fromLTRB(24.0, 6.0, 12.0, 6.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
    );
  }
}
