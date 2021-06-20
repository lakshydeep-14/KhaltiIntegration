import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:prashant/Screens/OverViewScreen.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/booking.dart';
import 'package:prashant/utils/consts.dart';

class ItemsScreen extends StatefulWidget {
  final String name;

  const ItemsScreen({Key key, this.name}) : super(key: key);
  @override
  _ItemsScreen createState() => _ItemsScreen();
}

class _ItemsScreen extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text("Brand Items",style: TextStyle(color: Colors.black),) ,backgroundColor: Colors.grey[200],centerTitle: true,elevation: 0,),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
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
        BoldText("5 Stars", 15.0, korangelite),
        Icon(
          Icons.collections_bookmark,
          color: kgreyDark,
          size: 15.0,
        ),
        NormalText(itemList[i].brand, kgreyDark, 15.0)
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

        
        // children: <Widget>[
        //   buildContainer(imageUrl: "moonlight.jpg",itemName: "MoonLight",location: "Kathmandu"),
        //   buildContainer(imageUrl:"shaara.jpg",itemName: "Shaara",location: "Pokhara" ),
        //   buildContainer(imageUrl: "yaatrih.jpg",itemName: "Yaatri",location: "Kathmandu"),
        //   buildContainer(imageUrl: "rupakot.jpg",itemName: "RupaKot",location: "Pokhara"),
        //   buildContainer(imageUrl: "harrison.jpg",itemName: "Harrison Palace",location: "Biratnagar"),
          
          

        // ],
      ),
    );
  }
}