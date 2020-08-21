import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animation = Tween(begin: 0.0,end: 10.0).animate(_controller)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse();
      }
    })
      ..addListener(() {
      setState(() {

      });
    });
//    animation = new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)
//      ..addListener(() {
//        setState(() {
//          _counter++;
//        });
//      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller.forward();
      },
        child : Container(
      child: Center(child: Text('TAP ON IT')),
      height: 60,
      width: 20*animation.value +20,
      decoration: BoxDecoration(
        color: Colors.blue,
          shape: BoxShape.rectangle),
    ));
  }
}
