import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class LoadingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Image.asset(
          'lib/images/logo-no-background.png',
          width: 60,
        ),
      ),
    );
  }
}
