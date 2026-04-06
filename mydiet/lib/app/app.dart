import 'package:flutter/material.dart';
import 'package:mydiet/app/features/home/main_home.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDiet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red
        ),
      ),
      home: MainHome(),
    );
  }
}