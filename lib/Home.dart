import 'package:flutter/material.dart';
import 'Khalti.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,centerTitle: true,
        title: Text('Khalti Integration',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)),
      body: Center(child: ElevatedButton(
        onPressed: ()=>khaltiScreen(context),
        child: Text("Khalti",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 25),),),),
      
    );
  }
}