import 'package:flutter/material.dart';
import 'package:flutter_expandable_text_view/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable TextView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpandableTextViewDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
