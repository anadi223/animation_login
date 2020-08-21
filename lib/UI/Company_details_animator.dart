import 'package:animation_tutorial/UI/company_details.dart';
import 'package:animation_tutorial/repo/repo.dart';
import 'package:flutter/material.dart';


class CompanyDetailsAnimator extends StatefulWidget {
  @override
  _CompanyDetailsAnimatorState createState() => _CompanyDetailsAnimatorState();
}

class _CompanyDetailsAnimatorState extends State<CompanyDetailsAnimator> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1800));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDetailsPage(controller: _controller, company: RepoData.bawp,);
  }
}
