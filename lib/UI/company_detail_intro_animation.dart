import 'package:flutter/material.dart';

class CompanyDetailIntroAnimation {
  CompanyDetailIntroAnimation({
    this.controller,
  })
      : bgdropOpacity = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.8, curve: Curves.ease))),
        bgdropBlue = Tween(begin: 0.0, end: 4.0).animate(CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.9, curve: Curves.ease))),
  nameOpacity = Tween(begin: 0.2,end: 1.0).animate(CurvedAnimation(parent: controller,curve: Interval(0.25,0.85,curve: Curves.easeIn))),
  locationOpacity = Tween(begin: 0.0,end: 0.85).animate(CurvedAnimation(parent: controller,curve: Interval(0.2,0.7,curve: Curves.easeIn))),
  dividerWidth = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller,curve: Interval(0.3,0.75,curve: Curves.easeIn))),
  aboutOpacity = Tween(begin: 0.0,end: 0.85).animate(CurvedAnimation(parent: controller,curve: Interval(0.4,0.9,curve: Curves.decelerate))),
  courseScrollerXTranslation = Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: controller,curve: Interval(0.5,1.00,curve: Curves.ease))),
  courseScrollerOpactiy = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller,curve: Interval(0.6,1.0,curve: Curves.fastOutSlowIn)));


  final AnimationController controller;
  final Animation<double> bgdropOpacity;
  final Animation<double> bgdropBlue;
  final Animation<double> nameOpacity;
  final Animation<double> locationOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> aboutOpacity;
  final Animation<double> courseScrollerXTranslation;
  final Animation<double> courseScrollerOpactiy;
}
