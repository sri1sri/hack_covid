import 'package:hackcovid/HomeScreens/viepolicydetails/premiumbreakup.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'insureddetails.dart';

//import 'no_access_screen.dart';

class Viewpolicydetails extends StatelessWidget {
  Viewpolicydetails({@required this.database,});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_Viewpolicydetails(database: database,),
    );
  }
}

class F_Viewpolicydetails extends StatefulWidget {
  F_Viewpolicydetails({@required this.database,});
  Database database;

  @override
  _F_ViewpolicydetailsState createState() => _F_ViewpolicydetailsState();
}

class _F_ViewpolicydetailsState extends State<F_Viewpolicydetails> {

  TextStyle selectedLabel = new TextStyle(
      color: Color(0xFF1F4B6E),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w600,
      fontSize: 25.0);

  TextStyle unselectedLabel = new TextStyle(
      color: Color(0xFF1F4B6E),
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w500,
      fontSize: 20.0);

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
      home: new DefaultTabController(
        length: categories.length,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(180),
            //preferredSize : Size(double.infinity, 100),
            child: CustomAppBar(
              leftActionBar: Container(
                child: Icon(
                  Icons.arrow_back,
                  size: 40,
                  color: Colors.black38,
                ),
              ),
              leftAction: () {
                Navigator.pop(context, true);
              },
              rightActionBar: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 40,
                    color: backgroundColor,
                  ),
                  onPressed: null,
                ),
              ),
              rightAction: () {
                print('right action bar is pressed in appbar');
              },
              primaryText: null,
              secondaryText: 'Store',
              tabBarWidget: Center(
                child: new TabBar(
                  labelColor: backgroundColor,
                  labelStyle: selectedLabel,
                  unselectedLabelStyle: unselectedLabel,
                  isScrollable: true,
                  tabs: categories.map((Category choice) {
                    return new Tab(
                      text: choice.name,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          body: new TabBarView(
            children: categories.map((Category choice) {
              if (choice.name == 'Premium break up') {
                return new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Insureddetails(),
                );
              } else {
                return new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Premiumbreakup(),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}