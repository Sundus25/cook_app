import 'dart:async';

import 'package:cook_project/view/login_page.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashChefAppState();
}

class _SplashChefAppState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Timer(
     const Duration(seconds: 5),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()),),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFA9A0C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/photo_2024-10-07_03-06-46.jpg'))),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Chef App',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}