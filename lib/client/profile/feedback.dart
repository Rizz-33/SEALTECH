import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class FeedbackTemplate extends StatelessWidget {
  final String email;
  final List<IconData> stars;
  final String feedback;
  final String comment;

  FeedbackTemplate({
    required this.email,
    required this.stars,
    required this.feedback,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380,
        height: 130,
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
                  padding: EdgeInsets.only(left: 16, bottom: 50),
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
                      child: Text(feedback,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 4),
                    Text(email,
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              left: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: Text(
                  comment,
                  style: TextStyle(fontSize: 13),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
