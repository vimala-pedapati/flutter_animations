import 'package:flutter/material.dart';
import 'dart:math' show pi;

enum CircleSide {left, right}

extension DrawPath on CircleSide{
  Path drawPath(Size size){
    Path path = Path();
     Offset? offset;
     bool? clockWise;
     switch (this){
       case CircleSide.left:
       path.moveTo(size.width, 0);
       offset = Offset(size.width, size.height);
       clockWise = false;
       break;
       case CircleSide.right:
       path.moveTo(0, 0);
       offset = Offset(0, size.height);
       clockWise = true;
       break;
     }

     path.arcToPoint(offset,radius: Radius.elliptical(size.width/2, size.height/2), clockwise: clockWise);
     path.close();
     return path;

  }
}

class DrawHalfCircle extends CustomClipper<Path>{
  final CircleSide? side;
  DrawHalfCircle({required this.side});
  @override
  Path getClip(Size size) => side!.drawPath(size); 
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}



class AnimatedCirceXYZ extends StatefulWidget {
  const AnimatedCirceXYZ({super.key});

  @override
  State<AnimatedCirceXYZ> createState() => _AnimatedCirceXYZState();
}

class _AnimatedCirceXYZState extends State<AnimatedCirceXYZ> with SingleTickerProviderStateMixin{
 AnimationController? animController;
 Animation<double>? animation;

 @override
  void initState() {
    animController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.0  , end : pi).animate(animController!);
    animController!.repeat();
    super.initState();
  }  
  @override
  void dispose() {
    animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animController! ,
      builder: (BuildContext context, Widget? child) { 
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(animation!.value)..rotateX(animation!.value)..rotateY(animation!.value),
          child:Container(
            width: 200,
            height: 100,
            color: Colors.transparent,
            child: getCircle())
        );
       },
    
    );
  }
}


Widget getCircle(){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: DrawHalfCircle(side: CircleSide.left),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
                
              ),
            ),
            ClipPath(
              clipper: DrawHalfCircle(side: CircleSide.right),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.cyan,
              ),
            ),
            
          ],
              );
       
}


