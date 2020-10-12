import 'package:flutter/material.dart';
// import 'package:nregauser/model/viewAllJobModel.dart';
import 'package:nregauser/transaction/apiUrls.dart';
import 'package:nregauser/transaction/request.dart';
import 'package:nregauser/util/Connection.dart';
import 'package:nregauser/view/drawer.dart';
import 'dart:convert';
import 'package:nregauser/util/Shared_Pref.dart';

class AcceptedJob extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AcceptedJobClass();
  }
}

class AcceptedJobClass extends State<AcceptedJob> {
  bool _internetConnection = false;
  bool _setLoader = true;
  bool _lengthNull = false;
  List viewAllJobList;
  List appliedJobInfo;
  double leftColumnwidth = 0.35;
  double rightColumnwidth = 0.55;
  var dateSelected;
  List allJobList;
  List appliedJobId=[];
  String userId;
  String userType;
  String userName;

  @override
  void initState() {
    super.initState();
    Future<String> p = SharedPreferencesTest.getUserId('userId');
    p.then((userid) {
      setState(() {
        userId = userid;
      });
    });
    Future<String> q = SharedPreferencesTest.getuserType('userType');
    q.then((usertype) {
      setState(() {
        userType = usertype;
      });
    });
    Future<String> r = SharedPreferencesTest.geuserName('userName');
    r.then((username) {
      setState(() {
        userName = username;
      });
    });
    viewJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Accepted Job"),
        ),
        drawer: Drawer1(),
        body: _internetConnection
            ? _setLoader
                ? _lengthNull == true
                    ? Center(
                        child: Text(
                          "No Record Found",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: 300),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                            Text(
                              "Loading...",
                            )
                          ],
                        ))
                : ListView.builder(
                    itemCount:
                        viewAllJobList == null ? 0 : viewAllJobList.length,
                    itemBuilder: (BuildContext context, i) {
                      return Column(children: <Widget>[
                        Container(
                            // height: MediaQuery.of(context).size.height * 0.09,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.01,
                                right:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                leftColumnwidth,
                                            child: Text(
                                              "Job Name:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                rightColumnwidth,
                                            child: Text(
                                                viewAllJobList[i].jobName,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1))),
                                          ),
                                        ],
                                      ),
                                      Divider(height: 5.0, color: Colors.grey),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                leftColumnwidth,
                                            child: Text(
                                              "Id:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                rightColumnwidth,
                                            child: Text(viewAllJobList[i].jobId,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1))),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                leftColumnwidth,
                                            child: Text(
                                              "Location:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                rightColumnwidth,
                                            child: Text(
                                                viewAllJobList[i].jobLocation,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1))),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                leftColumnwidth,
                                            child: Text(
                                              "Posted On:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                rightColumnwidth,
                                            child: Text(
                                                viewAllJobList[i].postedOn,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1))),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                leftColumnwidth,
                                            child: Text(
                                              "Deadline:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    88, 88, 88, 1),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                rightColumnwidth,
                                            child: Text(
                                                viewAllJobList[i].deadline,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1))),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15),
                                      ),
                                      appliedJobId.contains(viewAllJobList[i].jobId)? 
                                      Center(child: Text("You have applied for this"),)
                                      :Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.10,
                                              child: Container(
                                                  child: RaisedButton(
                                                      shape: new RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  5.0)),
                                                      color: Color(0xFF64B5F6),
                                                      child: Text('APPLY',
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .white)),
                                                      elevation: 6.0,
                                                      onPressed: () {
                                                        applyForJob(
                                                            viewAllJobList[i]
                                                                .jobId);
                                                      }))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ))
                      ]);
                    })
            : Center(
                child: Text(
                  "No Internet Connection..!!",
                  style: TextStyle(fontSize: 20),
                ),
              ));
  }

  Future viewJobs() async {
    Future internetConnection = Connection.internet();
    internetConnection.then((onValue) {
      if (onValue == false) {
        setState(() {
          _internetConnection = false;
        });
      } else {
        setState(() {
          _internetConnection = true;
        });

        print("idhare");
        sendGetRequest(API().dummyUrl + API().viewAllJob).then((response) {
          // print("in res");
          // ViewAllJobModel V =
          //     ViewAllJobModel.fromJson(json.decode(response.body));
          // print(V.code);
          // if (V.code == 200) {
          //   print("yyy");
          //   viewAllJobList = V.data[0].viewonlyjob;
          //   print("pppppppppp");
          //   print(viewAllJobList);
          //   appliedJobInfo = V.data[1].apply;
          //   for(var i =0;i<appliedJobInfo.length;i++){
          //     appliedJobId.add(appliedJobInfo[i].jobId);
          //   }
          //   print("awdfawf----------");
          //   print(appliedJobId);
          //   print(appliedJobInfo);
          //   setState(() {
          //     _setLoader = false;
          //   });
          //   print(viewAllJobList);
          // } else if (V.code == 404) {
          //   setState(() {
          //     _setLoader = false;
          //     _lengthNull = true;
          //   });
          // } else {
          //   print("ekse");
          //   setState(() {
          //     _setLoader = false;
          //   });
          // }
        }).catchError((onError) {
          // callToast("Something went wrong...", Colors.yellow);
          debugPrint("errroorr");
        });
      }
    });
  }

  applyForJob(jId) {

    Future applyForJob = sendPostRequest(API().dummyUrl + API().applyForJob, {
      "userId": userId,
      "jobId": jId,
      "userResponse": 1,
      "userType": userType,
      "adminStatus": 0
    });
    applyForJob.then((response) {
      print("tfght");
      print(response.body);
      // AddNewJobModel N =
      //     AddNewJobModel.fromJson(json.decode(response.body));
      // if (N.code == 200) {
      //   Navigator.pushReplacementNamed(
      //       context, "/home");
      // } else {}
    });
  }
}
