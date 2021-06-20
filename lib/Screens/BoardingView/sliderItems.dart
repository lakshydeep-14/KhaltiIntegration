import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant/Screens/Home.dart';
import 'package:prashant/utils/Buttons.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/consts.dart';
import 'package:prashant/utils/navigation.dart';

import '../SignInPage.dart';

class SlideItem extends StatefulWidget {


  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    onPressed (){
      Get.to(SignInPage());
        }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.6,
          width: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/title1.jpg"))),
        ),
        SizedBox(
          height: 60.0,
        ),
        BoldText("Gharbasie", 20.5, kblack),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child:Column(
                      children: <Widget>[
                        NormalText("Shopping From Home",kblack, 12.5),
                        SizedBox(
                          height: 50,
                        ),
                        WideButton("Lets go !!",onPressed),
                      ],
                    )),
        ),
      ],
    );
  }
}
