import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        Home.routeName: (context) => const Home(),
        Splash.routeName: (context) => const Splash(),
      },
      initialRoute: Splash.routeName,
    );
  }
}