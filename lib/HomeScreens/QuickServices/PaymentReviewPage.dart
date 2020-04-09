import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PaymentScreen.dart';
import 'package:hackcovid/HomeScreens/viewPolicyDetails//viewpolicydetailspage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PaymentReviewPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PaymentPage(),
    );
  }
}

class F_PaymentPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_PaymentPageState createState() => _F_PaymentPageState();
}

class _F_PaymentPageState extends State<F_PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(
              leftActionBar: Container(
                child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
              ),
              leftAction: () {
                Navigator.pop(context, true);
              },
              rightActionBar: Container(
                  child: Text(".....",style: TextStyle(color: Colors.white),)
              ),
              rightAction: () {
              },
              primaryText: 'Payment Review',
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    _buildImage1(),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            height:100,
            child: Padding(
              padding: const EdgeInsets.only(left:30.0,right:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 25,),
                      Text("Total Premium",style: subTextStyleBlue,),
                      Text("₹12,000",style: subTitleStyle,),
                    ],
                  ),
                  Container(
                    height: 50.0,
                    width: 150,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage() ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Pay Now",
                                style: subTextStylewhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );

  }


  _buildImage1() {
    return Card(
      child: Container(
          height: 450,
          width: 400,
          margin: const EdgeInsets.only(left: .2),
          child: Column(children: <Widget>[
            Stack(children: [
              Container(
                height: 400.0,
              ),
//              Positioned(
//                  left: 10.0,
//                  right: 10.0,
//                  top: 30.0,
//                  bottom: 10.0,
//                  child: Container(
//                      height: 120.0,
//                      width: 220.0,
////                      decoration: BoxDecoration(
////                        color: subBackgroundColor,
////                          borderRadius: BorderRadius.circular(10.0),
////                      ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(20.0),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            height: 50.0,
//                            width: 150,
//                            child: GestureDetector(
//                              onTap: () {
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(builder: (context) => ViewPolicyDetails(),),
//                                );
//                              },
//                              child: Container(
////                                decoration: BoxDecoration(
////                                  color: Colors.white,
////                                  borderRadius: BorderRadius.circular(30.0),
////                                ),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Center(
//                                      child: Text(
//                                        "View Details",
//                                        style: subTitleStyleLight,
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          SizedBox(height: 25,),
//                          Text("Easy Payment Options",style: subTitleStyleLite,),
//                          SizedBox(height: 15,),
//                          Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Text("* Instant Payment using UPI App",style: subTitleStyleWhiteContent,),
//                              SizedBox(height: 5,),
//                              Text("* Net Banking using Credit/Debit Card",style: subTitleStyleWhiteContent,),
//                              SizedBox(height: 5,),
//                              Text("* Using Wallet",style: subTitleStyleWhiteContent,),
//
//                            ],
//                          ),
//
//                        ],
//                      ),
//                    )
//                  ),
//              ),
              Positioned(
                  left: 0.0,
                  right: 0.0,
                  top:0,
                  bottom: 0.0,
                  child: Card(
//                    elevation: 15,
//                    shape: RoundedRectangleBorder(
//                      side: BorderSide(color: Colors.black54, width: 4),
//                      borderRadius: BorderRadius.circular(10),
//                    ),
                    child: Container(
                      height: 400,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(30.0),),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Owner Name",style: TextStyle(
                                    color: backgroundColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,decoration: TextDecoration.none),),
                                SizedBox(height: 10,),
                                Text("Nanditha",style: TextStyle(
                                    color: Color(0xFF253949).withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),),
                                SizedBox(height: 20,),
                                Text("Registration No.",style: TextStyle(
                                    color: backgroundColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,decoration: TextDecoration.none),),
                                SizedBox(height: 10,),
                                Text("TN66V6571",style: TextStyle(
                                    color: Color(0xFF253949).withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),),
                                SizedBox(height: 20,),
                                Text("Insured Declared Value",style: TextStyle(
                                    color: backgroundColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,decoration: TextDecoration.none),),
                                SizedBox(height: 10,),
                                Text("₹1,20,000",style: TextStyle(
                                    color: Color(0xFF253949).withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),),
                                SizedBox(height: 20,),
                                Text("Policy Start Date",style: TextStyle(
                                    color: backgroundColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,decoration: TextDecoration.none),),
                                SizedBox(height: 10,),
                                Text("April 21,2019",style: TextStyle(
                                    color: Color(0xFF253949).withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),),
                                SizedBox(height: 20,),
                                Text("Policy End Date",style: TextStyle(
                                    color: backgroundColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.0,decoration: TextDecoration.none),),
                                SizedBox(height: 10,),
                                Text("April 20,2020",style: TextStyle(
                                    color: Color(0xFF253949).withOpacity(0.6),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),),
                                SizedBox(height: 20,),

                              ],
                            ),
                          ),
                        ],
                      ) ,

                    ),
                  )),
            ]),
            Container(
              height: 50.0,
              width: 150,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewPolicyDetails(),),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "View Details",
                          style: subTitleStyleLight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ])),
    );
  }

}