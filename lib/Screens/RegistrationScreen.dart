import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prashant/Screens/SignInPage.dart';
import 'package:prashant/controllers/authController.dart';
import 'package:prashant/utils/Buttons.dart';
import 'package:prashant/utils/TextStyles.dart';
import 'package:prashant/utils/consts.dart';
import 'package:prashant/utils/forms.dart';

import 'SignInPage.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
   var emailCont=TextEditingController();
  var passwordCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: NormalText("Register", kblack, 20.0),
          backgroundColor: kwhite,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
          SizedBox(height: 10),
              BoldText("GharBasie", 30.0, kdarkBlue),
          SizedBox(
            height: 20,
          ),
          Container(width: 340.0, child: normalForm(icon:Icons.person, hint:"Full name")),
          SizedBox(
            height: 30,
          ),
              Container(width: 340.0, child: normalForm(icon:Icons.email,hint: "Email",controller: emailCont,textInputType: TextInputType.emailAddress)),
          SizedBox(
            height: 30,
          ),
          Container(
                width: 340.0,
                child: normalForm(icon:Icons.lock,hint: "Password",secure: true,suffix: true,controller: passwordCont )
              ),
                  SizedBox(
                    height: 30,
                  ),
                  WideButton.bold("Register", ()async {
                    final user=await Get.find<AuthController>().createUser(emailCont.text, passwordCont.text);
                    if(user!=null){
                      Get.offAll(SignInPage());
                    }
                  }, true),
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
                  Icon(
                    FontAwesomeIcons.facebookSquare,
                    color: Colors.blue.shade600,
                    size: 40.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      NormalText("Have an account ?", kdarkBlue, 12.5),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (context) => SignInPage(),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0,),
                          child: BoldText.veryBold("Sign In ?", 12.5, korange,true),
                        ),
                      ),
                    ],
                  ),
        ]))));
  }
}
