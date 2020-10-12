import 'package:flutter/material.dart';
import 'package:nregauser/view/drawer.dart';

class ReviewedJob extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ReviewedJobClass();
  }
}

class ReviewedJobClass extends State<ReviewedJob>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Review Job"),
      ),
      drawer: Drawer1(),
      body: Container(),
    );
  }
  
}