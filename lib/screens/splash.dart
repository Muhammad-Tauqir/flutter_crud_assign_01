import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SsplashScreen extends StatefulWidget {
  const SsplashScreen({super.key});

  @override
  State<SsplashScreen> createState() => _SsplashScreenState();
}

class _SsplashScreenState extends State<SsplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Shome()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(child: Image.asset('assets/images/1490.gif')),
        ),
      ),
    );
  }
}
