import 'dart:async';
import 'package:flutter/material.dart';

class intro_page extends StatefulWidget {
  const intro_page({Key? key}) : super(key: key);

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/');
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset("assets/images/weather.png",scale: 2.5,),
              SizedBox(
                height: 10,
              ),
              Image.asset("assets/gif/loading.gif"),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
