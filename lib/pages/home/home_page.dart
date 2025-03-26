import 'package:flutter/material.dart';
import 'package:wmyh/components/custom_app_bar.dart';
import 'package:wmyh/constants/dummy_stories.dart';
import 'widgets/date_selector.dart';
import 'widgets/story_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onMenuTap: () {}, onCalendarTap: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateSelector(
            onDateChanged: (date) {
              print('선택된 날짜: $date');
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final story = dummyStories[index];
                return index == 0
                    ? InkWell(
                      onTap: () {
                        print('Go to story create page');
                      },
                      child: StoryItem(year: '2025'),
                    )
                    : InkWell(
                      onTap: () {
                        print('Go to story detail page: ${story['createdAt']}');
                      },
                      child: StoryItem(
                        year: story['year'],
                        note: story['note'],
                      ),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
