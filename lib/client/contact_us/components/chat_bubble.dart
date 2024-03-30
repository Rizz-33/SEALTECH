import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurentUser;

  const ChatBubble({super.key, required this.message, required this.isCurentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurentUser
        ? (primaryColor)
        : (primary25),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
          color: isCurentUser
            ? Colors.white
            : accentColor),
      ),
    );
  }
}