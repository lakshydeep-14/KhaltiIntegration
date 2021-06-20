import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prashant/utils/BestRatedImage.dart';
import 'package:prashant/utils/Buttons.dart';
import 'package:prashant/utils/NepaliBrands.dart';
import 'package:prashant/utils/RecommendationImage.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/booking.dart';
import 'package:prashant/utils/consts.dart';
import 'package:prashant/utils/imageContainer.dart';
import 'package:prashant/utils/imageContainer.dart';

import 'OverViewScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageContainer(),

            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 5.0,bottom: 16.0,top:16),

              child: Column(children: <Widget>[

                _dailyOfferText(),

                _itemsListWidget(),

                _recommendedText(),
                
                _recommendedList(),

                Padding(
                  padding: const EdgeInsets.only( top: 10,bottom: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Top Rated Items", 20.0, kblack)),
                ),

                // _bestRatedList(),
                _recommendedList(),

                 
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 0.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BoldText("Nepali Brand", 20.0, kblack)),
                ),

                _awesomeBrandList(),
               

              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _awesomeBrandList(){
    return Container(
        height: 450,
        child: Center(
          child: GridView(
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
            shrinkWrap: false,
            children: [
              NepaliBrand("assets/WhatsApp Image 2021-04-11 at 8.11.15 AM.jpeg","Calibar"),
              NepaliBrand("assets/WhatsApp Image 2021-04-11 at 8.11.16 AM (1).jpeg","Yeti Carpet"),
              NepaliBrand("assets/WhatsApp Image 2021-04-11 at 8.11.15 AM (1).jpeg","Colors Mobile"),
              NepaliBrand("assets/WhatsApp Image 2021-04-11 at 8.11.16 AM.jpeg","Kiroz"),
  

            ],
          ),
        ),
      );
  }


  


Widget _dailyOfferText(){
  return  Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: BoldText("Daily Offers", 20.0, kblack)),
    );
}


Widget _recommendedText(){
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BoldText("Recommended for you", 20.0, kblack),
        Row(
          children: [
            BoldText("More", 15.0, korange),
            Icon(
              Icons.navigate_next,
              color: korange,
            ),
          ],
        )
      ],
    ),
  );
}

 Widget _recommendedList(){
   return Container(
      width: 400,
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          RecommendationImage("assets/WhatsApp Image 2021-04-10 at 11.34.29 PM.jpeg", "One Plus 9T", "One Plus"),
          RecommendationImage("assets/shoe_8.jpeg", "Heel", "Foot Wear"),
          RecommendationImage("assets/dress_8.jpeg", "Top", "T-Shirt"),
        ],
      ),
    );
 }

  

  Widget _itemsListWidget(){
    return Container(
        width: double.infinity,
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (context,i){
            return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return OverViewPage(itemList:itemList[i]);
            }));
          },
              child: Container(
                margin: const EdgeInsets.only(right:20,top: 5,bottom: 5,left: 5),
                width: 320,
                height: 170,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.white,
                boxShadow: [BoxShadow(color: kdarkBlue.withOpacity(0.2),blurRadius: 4,offset: const Offset(2,2))]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 170,
                      child: ClipRRect(
                          borderRadius: new BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          child: Image.asset(
                      "assets/"+itemList[i].imageUrl,
                      fit: BoxFit.fitHeight,
                    )),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BoldText(itemList[i].itemName, 20.5, kblack),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            
                            Icon(
                              Icons.collections_bookmark,
                              color: kgreyDark,
                              size: 15.0,
                            ),
                            SizedBox(width:5),
                            BoldText(itemList[i].brand, 15.0,kgreyDark,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                color: korange,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: kwhite,
                                    size: 15.0,
                                  ),
                                  BoldText("4.5", 15.0, kwhite)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            NormalText("(1024 Reviews)", kgreyDark, 11.0),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        BoldText("Book& Save 30% !", 14.0, Colors.red),
                        SizedBox(height: 14),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              width: 90,
                            ),
                            BoldText("More", 12.0, kblack),
                            Icon(
                              Icons.navigate_next,
                              size: 15.0,
                            ),
                          ],
                        )
    ],
  )
],
        ),
      ),
    );

                    },

                    
                   
                  ),
                );
  }
}
