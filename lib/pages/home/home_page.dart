import 'package:flutter/material.dart';
import 'package:wmyh/components/custom_app_bar.dart';
import 'widgets/date_selector.dart';
import 'widgets/note_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onMenuTap: () {}, onCalendarTap: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateSelector(),

          const SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return NoteItem(year: _yearAbbr(index));
              },
            ),
          ),
        ],
      ),
    );
  }

  String _yearAbbr(int idx) {
    const year = [
      '2025',
      '2024',
      '2023',
      '2022',
      '2021',
      '2020',
      '2019',
      '2018',
      '2017',
      '2016',
      '2015',
      '2014',
      '2013',
      '2012',
      '2011',
      '2010',
    ];
    return year[idx];
  }
}
