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

    Timer(Duration(seconds: 5),

            () => MyNavigator.goToIntro(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          FlareActor("images/walk.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'Untitled'),
          SizedBox(height: 30,),
          Text("Banking on\n your Finger Tips...!",style: titleStyle,)
        ],

      ),
    );
  }
}

