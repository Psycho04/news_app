import 'package:flutter/material.dart';
import 'package:news_app/screens/home/home.dart';

class Splash extends StatefulWidget {
  static const String routeName = 'Splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
void initState() {
  Future.delayed(const Duration(seconds: 2),() {
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, Home.routeName);
  },);
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/splash.png',
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.fill,
    );
  }
}