import 'package:cloud_firestore/cloud_firestore.dart';
class Item{
  String itemName,price,brand,imageUrl;
  Item({this.price="800.00",this.itemName,this.brand,this.imageUrl});
}
List<Item>itemList=[
  Item(imageUrl: "bag_brwon.jpeg",itemName: "Bag",brand: "Gucci"),
  Item(imageUrl:"shoe_1.jpeg",itemName: "Sports",brand: "Nike" ),
  Item(imageUrl: "spects.jpg",itemName: "Spects",brand: "Burberry"),
  Item(imageUrl: "watch_2.jpeg",itemName: "Watch",brand: "Rolex"),
  Item(imageUrl: "WhatsApp Image 2021-04-10 at 11.34.29 PM (1).jpeg",itemName: "Smart Phone",brand: "One Plus"),
  
];
class BookingList{

  static FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  static Future<DocumentReference> addBookingList(Item item){
    CollectionReference _itemReference = _firebaseFirestore.collection("bookingList");
    var data={
      'itemName':item.itemName,
      "brand":item.brand,
      "price":item.price
    };
    print("done");
    return _itemReference.add(data);
  }

}