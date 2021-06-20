import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant/Screens/ItemsScreen.dart';

import 'TextStyles.dart';
import 'consts.dart';

class NepaliBrand extends StatelessWidget {
  final String imgUrl;
  final String brands;

  NepaliBrand(this.imgUrl, this.brands);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
      onTap: ()=>Get.to(ItemsScreen()),
        child: Container(
          width: 180,
          height: 180,
          child: Stack(
            children: <Widget>[
              Container(
                  width: 180,
                  height: 180,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.all(Radius.circular(15.0)),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.4),
                      ))),
              Container(
                width: 180,
                
                child: Center(
                    
                    child: BoldText(brands,30,kwhite)),
              )
            ],
          ),
        ),
      );

  }
}
