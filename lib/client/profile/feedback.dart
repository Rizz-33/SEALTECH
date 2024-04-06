import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class FeedbackTemplate extends StatelessWidget {
  final String title;
  final String additionalText;
  final List<IconData> stars;
  final String comment;

  FeedbackTemplate({
    required this.title,
    required this.additionalText,
    required this.stars,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        height: 120,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: stars
                      .map((star) => Icon(star, color: primaryColor))
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 44),
                  child: Icon(
                    Icons.person,
                    size: 48,
                    color: primary75,
                  ),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(title, style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 4),
                    Text(additionalText, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                comment,
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
