import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/Claims.dart';
import 'package:hackcovid/HomeScreens/Policies.dart';
import 'package:hackcovid/HomeScreens/dashboard.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/navigationBar.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:provider/provider.dart';
import 'locationData.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_HomePage(),
    );
  }
}

class F_HomePage extends StatefulWidget {

  @override
  _F_HomePageState createState() => _F_HomePageState();
}

class _F_HomePageState extends State<F_HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    getUserLocation();
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
    Widget child;
    final database = Provider.of<Database>(context, listen: false);


    switch (currentIndex) {
      case 0:
        child = Dashboard(database: database);
        break;
      case 1:
        child = PoliciesPage(database: database,);
        break;
      case 2:
        child = ClaimsPage();
        break;
    }
    return Scaffold(
      body: SizedBox.expand(
        child: child,
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Home'),
            activeColor: subBackgroundColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Policies'),
            activeColor: subBackgroundColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.touch_app),
            title: Text('Claims'),
            activeColor: subBackgroundColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
