import 'package:faker/faker.dart';

// sorted by year
final List<Map<String, dynamic>> dummyStories = List.generate(5, (index) {
  final createdAt = faker.date.dateTime(minYear: 2010, maxYear: 2025);

  return {
    "id": index,
    "year": createdAt.year.toString(),
    "month": createdAt.month.toString(),
    "day": createdAt.day.toString(),
    "createdAt": createdAt,
    "note": faker.lorem
        .sentences(faker.randomGenerator.integer(20, min: 5))
        .join(' '),
  };
})..sort((a, b) => int.parse(b['year']).compareTo(int.parse(a['year'])));
