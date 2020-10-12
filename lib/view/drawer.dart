import 'package:flutter/material.dart';
import 'package:nregauser/util/Shared_Pref.dart';

class Drawer1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Drawer2();
  }
}

class Drawer2 extends State<Drawer1> {
  List environmentList = [];
  String userType;
  String userName;
  String userId;
  List r;

  @override
  void initState() {
    super.initState();
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

    Future<String> p = SharedPreferencesTest.getUserId('userId');
    p.then((userid) {
      setState(() {
        userId = userid;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        color: Color.fromRGBO(235, 235, 235, 1),
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          shrinkWrap: true,
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                  color: Colors.teal,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "Welcome to MNREGA Job Portal !",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      // ListTile(
                      //   title: Text(
                      //     "Your User Id is " + userId,
                      //     style: TextStyle(color: Colors.white, fontSize: 16),
                      //   ),
                      // ),
                      Padding(padding: EdgeInsets.all(0)),
                    ],
                  )),
            ),
            ListTile(
              leading: ImageIcon(
                new AssetImage('assetss/submenu_icon.png'),
                color: Color.fromRGBO(136, 136, 136, 1),
              ),
              title: Text(
                'View All Jobs',
              ),
              onTap: () {
                print(userType);
                Navigator.pop(context);
                userType == 'Admin'
                    ? Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false)
                    : Navigator.of(context).pushNamedAndRemoveUntil(
                        '/useralljob', (Route<dynamic> route) => false);
              },
            ),
            userType == 'Admin'
                ? ListTile(
                    leading: ImageIcon(
                      new AssetImage('assetss/submenu_icon.png'),
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    title: Text(
                      'Add New Job',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/addNewJob', (Route<dynamic> route) => false);
                    },
                  )
                : ListTile(
                    leading: ImageIcon(
                      new AssetImage('assetss/submenu_icon.png'),
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    title: Text(
                      'View Applied Jobs',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/viewuserappliedjobs',
                          (Route<dynamic> route) => false);
                    },
                  ),
            userType == 'Admin'
                ? ListTile(
                    leading: ImageIcon(
                      new AssetImage('assetss/submenu_icon.png'),
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    title: Text(
                      'Accepted Job',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/acceptedJob', (Route<dynamic> route) => false);
                    },
                  )
                : Container(),
            userType == 'Admin'
                ? ListTile(
                    leading: ImageIcon(
                      new AssetImage('assetss/submenu_icon.png'),
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    title: Text(
                      'Reviewd Job',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/reviewedJob', (Route<dynamic> route) => false);
                    },
                  )
                : Container(),
            userType == 'Admin'
                ? ListTile(
                    leading: ImageIcon(
                      new AssetImage('assetss/submenu_icon.png'),
                      color: Color.fromRGBO(136, 136, 136, 1),
                    ),
                    title: Text(
                      'Rejected Job',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/rejectedJob', (Route<dynamic> route) => false);
                    },
                  )
                : Container(),
            ListTile(
              leading: ImageIcon(
                new AssetImage('assetss/submenu_icon.png'),
                color: Color.fromRGBO(136, 136, 136, 1),
              ),
              title: Text(
                'Logout',
              ),
              onTap: () async {
                Navigator.pop(context);
                SharedPreferencesTest.remove();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
