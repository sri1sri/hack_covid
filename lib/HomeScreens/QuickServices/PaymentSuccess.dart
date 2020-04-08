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
class PaymentSuccess extends StatefulWidget {
  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 6),

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
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Payment Success",style: bigTitleStyle,),
            ),
            SizedBox(
              width: 500.0,
              height: 600.0,
              child: FlareActor("images/card-3.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'card'),
            ),
            //Splash(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Your Card details have been saved for future..! ",style: topNavigationBarTitleStyle,),
            ),

          ],
        ) ,
      ),
    );
  }
}

