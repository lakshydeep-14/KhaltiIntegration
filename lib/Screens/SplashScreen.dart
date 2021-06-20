import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/consts.dart';

import 'BoardingView/OnBoardingScreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: korange,
        body:Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Icon(FontAwesomeIcons.plane,color: kwhite,size: 70,),
              //SizedBox(height: 50),
              //BoldText("Aight",35.0,kdarkBlue),
              TypewriterAnimatedTextKit(
                text: ["GharBasie"],
                textStyle: TextStyle(fontSize: 30.0,color: kwhite,fontFamily: "nunito"),
                speed: Duration(milliseconds: 150),
              )


            ],
          ),
        )

    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:2 ),(){
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return LandingPage();
      }));
    });
  }
}
