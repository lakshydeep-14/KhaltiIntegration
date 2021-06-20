import 'package:flutter/material.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/consts.dart';
import 'package:get/get.dart';
import 'package:prashant/controllers/authController.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    //Get.putAsync<AuthController>(() async => await AuthController());
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        title: BoldText("Profile", 25, kblack),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kgreyDark,
                    radius: 50,
                    child: Icon(Icons.person,size: 50,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      
                     // BoldText(Get.find<AuthController>().userEmail.toString(),20.0,kblack),

                      Icon(
                            Icons.location_on,
                            color: kgreyDark,
                            size: 15.0,
                          ),
                      BoldText("Prashant Chaudhary",20.0,kblack),
                      Row(
                        children: <Widget>[
                          NormalText("Biratnagar,Nepal",kgreyDark,16),
                          
                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              height: 2,
              color: kgreyFill,
            ),
            ProfileItem(Icons.person,"My Informations"),
            SizedBox(height:8),
            ProfileItem(Icons.credit_card,"Payment"),SizedBox(height:8),
            ProfileItem(Icons.settings,"Settings"),SizedBox(height:8),
            ProfileItem(Icons.help,"Help"),SizedBox(height:8),
            ProfileItem(Icons.favorite_border,"Favourite"),SizedBox(height:8),
            ProfileItem(Icons.library_books,"Terms and Conditions"),SizedBox(height:8),
            ProfileItem(Icons.info,"About Us "),SizedBox(height:8),
            ProfileItem(Icons.exit_to_app,"Sign Out"),


          ],
        ),
      ),
    );
  }

  Widget ProfileItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 9),
      child: Row(
              children: <Widget>[
                Icon(icon, color: kdarkBlue,size: 40,),
                SizedBox(width: 8,),
                NormalText(text,kblack,20.0)
              ],
            ),
    );
  }
}
