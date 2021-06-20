import 'package:flutter/material.dart';

import 'TextStyles.dart';
import 'consts.dart';
import 'forms.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 300.0,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,width: double.infinity,
              child: Image.asset(
                "assets/title3.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BoldText("What are you", 30.0, Colors.blue[900]),
                  BoldText("Looking for?", 30.0, Colors.blue[900]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0, left: 20, right: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: normalForm(icon:Icons.search, hint:"Where do you want to go"),
            ),
          )
        ],
      ),
    );
  }
}
