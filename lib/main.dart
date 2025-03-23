import 'package:flutter/material.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WMYH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      home: const HomePage(),
    );
  }
}
