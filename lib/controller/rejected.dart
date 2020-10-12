import 'package:flutter/material.dart';
import 'package:nregauser/view/drawer.dart';

class RejectedJob extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RejectedJobClass();
  }
}

class RejectedJobClass extends State<RejectedJob>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Rejected Job"),
      ),
      drawer: Drawer1(),
      body: Container(),
    );
  }
  
}