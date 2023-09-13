import 'package:flutter/material.dart';

import 'features/ui/pages/toto_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.deepPurple
      ),
     home:  TodoListingScreen(),
    );
  }
}
