import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/home_page.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/widgets/my_navigator.dart';
import 'package:flare_flutter/flare_actor.dart';

var routes = <String, WidgetBuilder>{
  "/intro": (BuildContext context) => HomePage(),
};

class MyNavigator {

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}
class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),

            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage( ) ),
              );
            },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Hack Covid",style: bigTitleStyle,),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: FlareActor("images/walk.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'Untitled'),
            ),
            //Splash(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("We Bought \nour banking at your FingerTips...!",style: topNavigationBarTitleStyle,),
            ),

          ],
        ) ,
      ),
    );
  }
}

