import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class UserTile extends StatelessWidget {
  final String text;
  final bool isNewMessage;
  final void Function()? onTap;

  const UserTile({
    Key? key,
    required this.text,
    required this.isNewMessage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isNewMessage ? primary50 : secondaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person, color: primaryColor,),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontWeight: isNewMessage ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
