import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_circle_spinning_xyz.dart';
import 'package:flutter_animations/animated_rectangular.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body:  Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 30,top: 20,bottom: 30), 
              child: AnimatedRectangular(),
            ),
            AnimatedCirceXYZ(),

            
          ],
        ),
      ),
    );
  }
}


