import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final String? year;

  const NoteItem({super.key, this.year});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                year ?? '',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eleifend dui ut semper vulputate. Morbi tempus, risus a euismod varius, turpis justo tristique nibh, eget efficitur erat nulla non sapien. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
