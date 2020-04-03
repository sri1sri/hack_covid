import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PlanDetails.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PolicyDetails.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PremiumPlansPage extends StatelessWidget {

  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PremiumPlansPage(),
    );
  }
}

class F_PremiumPlansPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_PremiumPlansPageState createState() => _F_PremiumPlansPageState();
}

class _F_PremiumPlansPageState extends State<F_PremiumPlansPage> {


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
          backgroundColor: Colors.white ,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/6),
            child: CustomAppBar(
              leftActionBar: Container(
                child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
              ),
              leftAction: () {
                Navigator.pop(context, true);
              },
              rightActionBar: Container(
                child: Text("......",style: TextStyle(color: Colors.white,)),
              ),
              rightAction: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => SettingsPage() ),
//                );
              },
              primaryText: 'Premium Plans',
              secondaryText: null,
            ),
          ),
          body: DefaultTabController(
            length: 4,
              child: Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15.0),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Choose your Plans",style: subTitleStyleLight),
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
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                  Text("Diamond Plan",style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),),
                                  SizedBox(height: 3,),
                                  Text("₹12,000"),
                                ],
                                 ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Text("Gold Plan",style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0),),
                                    SizedBox(height: 3,),
                                    Text("₹12,000"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                  Text("Silver Plan",style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),),
                                  SizedBox(height: 3,),
                                  Text("₹12,000"),
                                ],
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5,),
                                  Text("Bronze Plan",style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0),),
                                  SizedBox(height: 3,),
                                  Text("₹12,000"),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                  body: TabBarView(
                      children: [
                        PremiumPlanDetailsPage(),
                        PremiumPlanDetailsPage(),
                        PremiumPlanDetailsPage(),
                        PremiumPlanDetailsPage(),
                  ]),
                ),
              )
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left:30.0,right:30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10,),
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
                                builder: (context) => PolicyRegistrationPage() ),
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
                                  "Proceed",
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
          ),
        )
    );

  }

}


