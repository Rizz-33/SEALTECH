import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final bool enableIcon;
  final VoidCallback onPressed;
  final String color;
  final bool isStroked;
  final double width;

  Button({
    required this.buttonText,
    this.enableIcon = true,
    required this.onPressed,
    this.color = 'orange',
    this.isStroked = false,
    this.width = 400,
  });

  Button.white({ // Add a new constructor for white color button
    required this.buttonText,
    this.enableIcon = true,
    required this.onPressed,
    this.isStroked = false,
    this.width = 400,
  }) : color = 'white';

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color borderColor;
    if (color == 'black') {
      buttonColor = Colors.black;
      borderColor = Colors.black;
    } else {
      buttonColor = color == 'white' ? Colors.white : Color(0xFFFF8400);
      borderColor = color == 'white' ? Colors.white : Color(0xFFFF8400);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isStroked ? Colors.transparent : buttonColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isStroked ? buttonColor : borderColor,
              width: 2,
            ),
          ),
          child: SizedBox(
            height: 50,
            width: width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: isStroked ? buttonColor : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (enableIcon) SizedBox(width: 10),
                  if (enableIcon)
                    Icon(
                      Icons.arrow_forward,
                      color: isStroked ? buttonColor : Colors.white,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}