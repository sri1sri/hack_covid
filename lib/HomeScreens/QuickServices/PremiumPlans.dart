import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PlanDetails.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PolicyDetails.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/firebase/database.dart';

class PremiumPlansPage extends StatelessWidget {

  PremiumPlansPage({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PremiumPlansPage(database: database,),
    );
  }
}

class F_PremiumPlansPage extends StatefulWidget {
  F_PremiumPlansPage({@required this.database});
  Database database;

  @override
  _F_PremiumPlansPageState createState() => _F_PremiumPlansPageState();
}

class _F_PremiumPlansPageState extends State<F_PremiumPlansPage> {

  String totalPremium = '12,492';


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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
              onPressed: (){
                Navigator.pop(context, true);
              },
            ),
            title: Text("Premium Plans",style: titleStyleTheam,),
          ),
          body: DefaultTabController(
            length: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0),
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Choose your Plans",style: subTitleStyleLight),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      bottom: TabBar(
                        onTap: (value)=>{

                          if(value == 0){
                          setState(() {
                          totalPremium='12,492';
                          TOTALPREMIUM = totalPremium;
                    }),
                          }else if(value == 1){
                            setState(() {
                              totalPremium='11,954';
                              TOTALPREMIUM = totalPremium;

                            }),
                          }else if(value == 2){
                            setState(() {
                              totalPremium='10,083';
                              TOTALPREMIUM = totalPremium;

                            }),
                          }else if(value == 3){
                            setState(() {
                              totalPremium='9,839';
                              TOTALPREMIUM = totalPremium;

                            }),
                          }
                          },
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
                                    Text("₹12,492"),
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
                                      Text("₹11,954"),
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
                                    Text("₹10,083"),
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
                                    Text("₹9,839"),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                    body: TabBarView(
                        children: [
                          PremiumPlanDetailsPage(type: 0, keyProtect: '₹1,341',engineProtect: '₹10,812',garageCash: '₹8,742'),
                          PremiumPlanDetailsPage(type: 1, keyProtect: '₹1,235',engineProtect: '₹9,653',garageCash: '₹7,543'),
                          PremiumPlanDetailsPage(type: 2, keyProtect: '₹1,146',engineProtect: '₹8,098',garageCash: '₹6,931'),
                          PremiumPlanDetailsPage(type: 3, keyProtect: '₹987',engineProtect: '₹6,621',garageCash: '₹6,435'),
                    ]),
                  ),
                ),

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
                        Text('₹$totalPremium',style: subTitleStyle,),
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
                                builder: (context) => PolicyRegistrationPage(database: widget.database,) ),
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


