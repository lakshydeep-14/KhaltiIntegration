import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prashant/utils/Buttons.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/booking.dart';
import 'package:prashant/utils/consts.dart';

import 'Khalti.dart';

class OverViewPage extends StatefulWidget {
  final Item itemList;

  const OverViewPage({Key key, this.itemList}) : super(key: key);
  @override
  _OverViewPageState createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,title: BoldText(widget.itemList.itemName, 24, kdarkBlue),centerTitle: true,elevation: 0,),
      bottomNavigationBar: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                          child: WideButton(
                              "ORDER NOW",
                              () {
                                khaltiScreen(context,item: widget.itemList,);
                              },
                            ),
                        ),
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height:  0.3*MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/"+widget.itemList.imageUrl,fit: BoxFit.fill,)),
          ),
          Positioned(
            top: 250.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 0.7*MediaQuery.of(context).size.height,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                     
                      TabBarView(
                        children: <Widget>[
                          _overview(),
                          
                          _review(),
                        ],
                        controller: tabController,
                      ),
                      
                    ],
                  ),
                ),
              ),
            ),
          ),
         
        ],
      ),
    );
  }
  Widget _review(){
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Reviews", 20.0, kblack),
                  BoldText("See all", 16, kdarkBlue),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: korange,
                      borderRadius:
                          BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: kwhite,
                          size: 15.0,
                        ),
                        BoldText("4.5", 15.0, kwhite),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  NormalText(
                      "(420 reviews)", kgreyDark, 14),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              reviewProfile("Hichem","5.0","05,Mar,2020"),
              reviewProfile("Walid","3.5","17,feb,2020"),
              reviewProfile("kratos","4.0","10,jan,2020"),
              reviewProfile("Hichem","5.0","05,Mar,2020"),
              reviewProfile("Walid","3.5","17,feb,2020"),
              reviewProfile("kratos","4.0","10,jan,2020"),

              SizedBox(
                height: 50,
              ),
              
            ],
          ),
        ),
      );
  }
  
Widget _overview(){
  return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BoldText(widget.itemList.itemName, 20.0, kblack),
              Row(
                children: <Widget>[
                  
                  Icon(
                    Icons.branding_watermark_outlined,
                    color: kgreyDark,
                    size: 15.0,
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  BoldText(widget.itemList.brand, 15.0,kgreyDark),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              NormalText(
                  "500 per item", kgreyDark, 16.0),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 2,
                color: kgreyFill,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("About this item", 20.0, kblack),
                  BoldText("More", 16, kdarkBlue)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              NormalText(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea. ",
                  kblack,
                  12.0),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 2,
                color: kgreyFill,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText("Varieties", 20.0, kblack),
                  BoldText("More", 16, kdarkBlue),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: <Widget>[
                  equipmentsItem(Icons.format_color_fill, "Color"),
                  SizedBox(width:10),
                  equipmentsItem(
                      Icons.photo_size_select_small, "Size"),
                  // equipmentsItem(Icons.pool, "Pool"),
                  // equipmentsItem(
                  //     Icons.restaurant, "Restaurant"),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );
}
  Widget reviewProfile(String name,String review,String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Row(
          children: <Widget>[
            Container(
              width: 24,
              height: 24,
              child: CircleAvatar(
                backgroundColor: kgreyDark,
                child: Icon(
                  Icons.person,
                  size: 12,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            BoldText(name, 16, kblack)
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              decoration: BoxDecoration(
                color: korange,
                borderRadius:
                BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: kwhite,
                    size: 15.0,
                  ),
                  BoldText(review, 15.0, kwhite),
                ],
              ),
            ),
            SizedBox(width: 10,),
            NormalText(date,kgreyDark,12.0)
          ],

        ),
        SizedBox(height: 10,),
        NormalText("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",kblack,12.0),
        SizedBox(height: 10,),
      ],
    );
  }

  Column equipmentsItem(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: kdarkBlue,
        ),
        NormalText(text, kdarkBlue, 12)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
