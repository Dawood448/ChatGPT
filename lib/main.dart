import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/home_screen.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
          splash: Image.asset("asset/4712010.png"),
          nextScreen:  const HomeScreen(),
          splashTransition: SplashTransition.rotationTransition,
          animationDuration:const  Duration(seconds: 5),),
    );
  }
}
