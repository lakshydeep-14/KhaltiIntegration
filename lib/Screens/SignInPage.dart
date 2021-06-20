import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prashant/Screens/DashBoard.dart';
import 'package:prashant/Screens/RegistrationScreen.dart';
import 'package:prashant/controllers/authController.dart';
import 'package:prashant/utils/Buttons.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/consts.dart';
import 'package:prashant/utils/forms.dart';
import 'package:get/get.dart';

import '../utils/forms.dart';
import 'Home.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();}

class _SignInPageState extends State<SignInPage> {
  
  var emailCont=TextEditingController();
  var passwordCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.putAsync<AuthController>(() async =>await  AuthController());
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: NormalText("SignIn", kblack, 20.0),
        backgroundColor: kwhite,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
             
              SizedBox(height: 10),
              BoldText("GharBasie", 30.0, kdarkBlue),
              
              SizedBox(
                height: 30,
              ),
              Container(width: 340.0, child: normalForm(icon:Icons.email,hint: "Email",controller: emailCont,textInputType: TextInputType.emailAddress)),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 340.0,
                child: normalForm(icon:Icons.lock,hint: "Password",secure: true,suffix: true,controller: passwordCont )
              ),
              SizedBox(
                height: 25,
              ),
              WideButton.bold("SIGN IN", () async{
              //   final email=emailCont.text;
              //   final pass=passwordCont.text;
              //  final user= await Get.find<AuthController>().login(email:email,password: pass);
              //  if(user!=null){
                 Get.offAll(Home());
          //      }else{
          //         Get.snackbar("Unable to sign in!","Wrong email or password",
          // snackPosition: SnackPosition.BOTTOM);
                 
          //      }
              }, true),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: BoldText.veryBold(
                        "Forgot your Password ?", 12.5, kdarkBlue, true),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 100,
                    color: kdarkBlue,
                  ),
                  NormalText("Or Sign in with", kdarkBlue, 12.5),
                  Container(
                    height: 2,
                    width: 100,
                    color: kdarkBlue,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: ()async{
                  final user= await Get.find<AuthController>().signInWithGoogle();
               if(user!=null){
                 Get.offAll(Home());
               }else{
                  Get.snackbar("Unable to sign in!","Wrong email or password",
          snackPosition: SnackPosition.BOTTOM);
                 
               }
                },
                child: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.green,
                  size: 40.0,
                ),
              ),
              SizedBox(
                height: 65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NormalText("Don't have an account ?", kdarkBlue, 12.5),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(CupertinoPageRoute<bool>(
                        fullscreenDialog: true,
                        builder: (context) => RegistrationScreen(),
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 8.0,
                      ),
                      child:
                          BoldText.veryBold("Register ?", 12.5, korange, true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
