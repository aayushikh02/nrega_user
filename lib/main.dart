// final project User--

import 'package:flutter/material.dart';
import 'package:nregauser/controller/accepted.dart';
import 'package:nregauser/controller/addNew.dart';
import 'package:nregauser/controller/appliedJobs.dart';
import 'package:nregauser/controller/home.dart';
import 'package:nregauser/controller/login.dart';
import 'package:nregauser/controller/rejected.dart';
import 'package:nregauser/controller/review.dart';
import 'package:nregauser/controller/userAllJob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        "/home": (BuildContext context) => Home(),
        "/login": (BuildContext context) => Login(),
        "/addNewJob": (BuildContext context) => AddNewJob(),
        "/rejectedJob": (BuildContext context) => RejectedJob(),
        "/acceptedJob": (BuildContext context) => AcceptedJob(),
        "/reviewedJob": (BuildContext context) => ReviewedJob(),
        "/useralljob": (BuildContext context) => UserAllJob(),
        "/viewuserappliedjobs": (BuildContext context) => AppliedJobs(),
      },
      home: UserAllJob(),
    );
  }
}
