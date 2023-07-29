import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        fontFamily: "NotoSans",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      home: const FeedScreen(),
    );
  }
}
