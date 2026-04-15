import 'package:flutter/material.dart';
import 'package:mydiet/app/pages/main_homepage.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDiet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent
        ),
      ),
      home: MainHome(),
    );
  }
}