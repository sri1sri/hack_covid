import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flare_flutter/flare_actor.dart';

class NoAccessPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_NoAccessPage(),
    );
  }
}

class F_NoAccessPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_NoAccessPageState createState() => _F_NoAccessPageState();
}

class _F_NoAccessPageState extends State<F_NoAccessPage> {

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
          backgroundColor:Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/4.5),
            child: CustomAppBar(
              leftActionBar: Container(
                child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
              ),
              leftAction: () {
                Navigator.pop(context, true);
              },
              rightActionBar: Container(
                child: Text("......",style: TextStyle(color: Colors.white),)
              ),
              rightAction: () {

              },
              primaryText: "",
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Comming Soon",style: bigTitleStyle,),
                    ),
                    SizedBox(
                      width: 400.0,
                      height: 400.0,
                      child: FlareActor("images/empty.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'Swing'),
                    ),
                    //Splash(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('This Feature is \nnot yet Implemented....!',style: titleStyle,),
                    ),

                  ],
                ) ,
              ),
            ),
          ),
        )
    );

  }

}