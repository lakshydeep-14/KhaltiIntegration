import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant/Screens/ItemsScreen.dart';

import 'TextStyles.dart';
import 'consts.dart';

class RecommendationImage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String brand;

  RecommendationImage(this.imageUrl, this.name, this.brand);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
      onTap: ()=>Get.to(ItemsScreen(name: name,)),
        child: Center(
          child: Container(
            width: 150,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  child: ClipRRect(
                      borderRadius: new BorderRadius.all(
                        Radius.circular(15),),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.fitHeight,
                      )),
                ),
                BoldText(name,16.0,kblack),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.branding_watermark_outlined,color: kgreyDark,size: 12.0,),
                    SizedBox(width:5),
                    NormalText(brand,kgreyDark,12.0),
                    

                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

}
