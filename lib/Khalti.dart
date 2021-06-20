import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prashant/Home.dart';

khaltiScreen(BuildContext context){
  FlutterKhalti _flutterKhalti=FlutterKhalti.configure(
    publicKey: "test_public_key", 
    urlSchemeIOS: "Integrating Khalti");
    KhaltiProduct product=KhaltiProduct(
      id: "Integrating Khalti to my flutter app",
      amount: 100000,
      name: "Payment for item",
    );
    _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data)async {
         try {
            Fluttertoast.showToast(msg: "Success",timeInSecForIosWeb:25 );
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));
          }catch (e) {
            Fluttertoast.showToast(msg: e,timeInSecForIosWeb:25 );
          }
      },
      onFaliure: (error){
        Fluttertoast.showToast(msg: "Error",timeInSecForIosWeb:25 );
      }
    );
}