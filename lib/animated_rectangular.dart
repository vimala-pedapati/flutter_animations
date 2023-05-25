import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedRectangular extends StatefulWidget {
  const AnimatedRectangular({super.key});

  @override
  State<AnimatedRectangular> createState() => _AnimatedRectangularState();
}

class _AnimatedRectangularState extends State<AnimatedRectangular>
    with SingleTickerProviderStateMixin {
  AnimationController? animatedController;
  Animation<double>? animation;

  @override
  void initState() {
    animatedController =   AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =  Tween<double>(begin: 0.0, end: 2 * pi).animate(animatedController!);
    animatedController!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animatedController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animatedController!,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(animation!.value)..rotateY(0.0)..rotateX(0),
          child:customContainer(),
        );
      }
    );
    
  }
}


Widget customContainer(){
  return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const[
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0,3)
                ) 
              ]
            ),
          );
}