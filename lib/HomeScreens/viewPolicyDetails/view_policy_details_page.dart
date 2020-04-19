import 'package:hackcovid/HomeScreens/viewPolicyDetails//premium_breakup.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:flutter/material.dart';
import 'insureddetails.dart';

//import 'no_access_screen.dart';

class ViewPolicyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ViewPolicyDetails(),
    );
  }
}

class F_ViewPolicyDetails extends StatefulWidget {
//  F_Viewpolicydetails({@required this.database,});
//  Database database;

  @override
  _F_ViewPolicyDetailsState createState() => _F_ViewPolicyDetailsState();
}

class _F_ViewPolicyDetailsState extends State<F_ViewPolicyDetails> {


  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
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
          body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.only(left:5.0,right: 5.0),
                child: Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                    title: Text("View Policy Details",style: subTitleStyleBlue),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    bottom: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: backgroundColor,
                        unselectedLabelStyle: subTitleStyleWhite,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: backgroundColor),
                        tabs: [
                          Tab(

                            child: Text("Premium break up",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0),),
                          ),
                          Tab(
                            child:
                                    Text("Insured details",style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0),),

                          ),
                        ]),
                  ),
                  body: TabBarView(
                      children: [
                        Premiumbreakup(),
                        Insureddetails(),
                      ]),
                ),
              )
          ),
    ));
  }
}
