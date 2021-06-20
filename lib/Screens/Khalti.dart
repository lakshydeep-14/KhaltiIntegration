import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';
import 'package:get/get.dart';
import 'package:prashant/utils/booking.dart';

khaltiScreen(BuildContext context,{Item item}){
  FlutterKhalti _flutterKhalti=FlutterKhalti.configure(
    publicKey: "test_public_key_9b6f64a2cf44469298885231c38223fc", 
    urlSchemeIOS: "KhaltiPayFlutterExampleSchema");
    KhaltiProduct product=KhaltiProduct(
      id: "test",
      amount: 80000,
      name: "Payment for item",
    );
    _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data)async {
         try {
            await BookingList.addBookingList(item);
            Get.back();
          }catch (e) {
                print(e);
          }
        print("success");
      },
      onFaliure: (error){
        print(error);
      }
    );
}