import 'file:///F:/study/flutter/app_revision_june4/animation_tutorial/lib/some%20animation/chain_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}):super(key:key);

  @override
  _AnimationPageState createState() => _AnimationPageState();


}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{


  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1800,),vsync: this);
    animation = CurvedAnimation(parent: controller,curve: Curves.easeIn)..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          controller.reverse();
        }else if(status == AnimationStatus.dismissed) {
          controller.forward();
        }

    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChainAnimation(animation: animation),
    );
  }
}
