import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animation_tutorial/UI/company_detail_intro_animation.dart';
import 'package:animation_tutorial/UI/course_card.dart';
import 'package:animation_tutorial/model/company.dart';
import 'package:flutter/material.dart';

class CompanyDetailsPage extends StatelessWidget {
  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = CompanyDetailIntroAnimation(controller: controller);

  final Company company;
  final CompanyDetailIntroAnimation animation;
  var screenHeight = window.physicalSize.height / window.devicePixelRatio;
  var screenWidth = window.physicalSize.width / window.devicePixelRatio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: animation.bgdropOpacity.value,
              child: Image.asset(
                company.backdropPhoto,
                fit: BoxFit.fitHeight,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: animation.bgdropBlue.value,
                  sigmaY: animation.bgdropBlue.value),
              child: Container(
                color: Colors.black.withOpacity(0.1),
                child: _createContent(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createAboutCompany(),
          _createCourseScroller(),
        ],
      ),
    );
  }

  Widget _createAboutCompany() {
    return Padding(
      padding: EdgeInsets.only(top: 80.0, left: 18.0, right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorizeAnimatedTextKit(
            isRepeatingAnimation: true,
              totalRepeatCount: 10,
              onTap: () {},
              text: [
                company.name,
              ],
              textStyle: TextStyle(
                  fontSize: screenHeight/18 * animation.nameOpacity.value + 2.0,
                  color: Colors.white.withOpacity(
                    animation.nameOpacity.value,
                  ),
                  fontWeight: FontWeight.bold),
              colors: [
                Colors.white,
                Colors.yellow,
                Colors.orange,
                Colors.cyan,
              ],
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),
//          Text(
//            company.name,
//            style: TextStyle(
//                fontSize: screenHeight/18 * animation.nameOpacity.value + 2.0,
//                color: Colors.white.withOpacity(
//                  animation.nameOpacity.value,
//                ),
//                fontWeight: FontWeight.bold),
//          ),
          Text(
            company.location,
            style: TextStyle(fontSize: screenHeight/25,
                color:
                    Colors.white.withOpacity(animation.locationOpacity.value),
                fontWeight: FontWeight.w500),
          ),
          Container(
            color: Colors.white.withOpacity(0.79),
            margin: EdgeInsets.symmetric(vertical: 14.0),
            width: animation.dividerWidth.value*224,
            height: 1.0,
          ),
          Text(company.about,style: TextStyle(
            fontSize: screenHeight/35,
              color: Colors.white.withOpacity(animation.aboutOpacity.value),height: 1.4),),
        ],
      ),
    );
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight/25.0),
      child: Transform(transform:Matrix4.translationValues(animation.courseScrollerXTranslation.value*60, 0.0, 0.0),
        child: SizedBox.fromSize(size: Size.fromHeight(250),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            itemCount: company.courses.length,
            itemBuilder: (BuildContext context,int index){
            var course = company.courses[index];
            return CourseCard(course);
            }),),
      ),
    );
  }

}
