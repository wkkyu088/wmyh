import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String? year;
  final String? note;

  const StoryItem({super.key, this.year, this.note});

  @override
  Widget build(BuildContext context) {
    final thisYear = DateTime.now().year.toString();
    final isThisYear = year == thisYear;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  isThisYear
                      ? Positioned(
                        bottom: 2,
                        child: Container(
                          width: 60,
                          height: 7,
                          color: Colors.grey[300],
                        ),
                      )
                      : Container(),
                  Text(
                    year ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          isThisYear ? FontWeight.bold : FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),

        Container(
          width: double.infinity,
          height: note == null ? 100 : null,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            note ?? 'whayt makes you happy today?',
            style: TextStyle(
              fontSize: 13,
              color: note == null ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
