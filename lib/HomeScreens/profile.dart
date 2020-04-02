import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
//import 'package:hackcovid/Database_models/UserDetails.dart';
//import 'package:paystream/HomeScreens/Settings.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_alert_dialog.dart';
//import 'package:hackcovid/firebase/auth.dart';
//import 'package:hackcovid/firebase/database.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

//void customLaunch(command) async{
//  if(await canLaunch(command)){
//    await launch(command);
//
//  }else{
//    print('could not launch $command');
//  }
//}

class ProfilePage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ProfilePage(),
    );
  }
}

class F_ProfilePage extends StatefulWidget {
 // F_ProfilePage({@required this.database});
 // Database database;

  @override
  _F_ProfilePageState createState() => _F_ProfilePageState();
}

class _F_ProfilePageState extends State<F_ProfilePage> {

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
                    child: Icon(Icons.settings,color: subBackgroundColor,),
                  ),
                  rightAction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsPage() ),
                    );
                  },
                  primaryText: 'Profile',
                  secondaryText: null,
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        children: <Widget>[
                          Container(
                            height: 500,
                            decoration: BoxDecoration(
                              color: subBackgroundColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10.0),),
                            child:Column(
                              children: <Widget>[
                                SizedBox(height: 20,),
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 30,),
                                    Center(
                                      child: CircleAvatar(
                                        child: Text(
                                          'SK',
                                          style: titleStylelight,
                                        ),
                                        radius: 50.0,
                                        backgroundColor:
                                        subBackgroundColor,
                                      ),
                                    ),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Srivatsav Konda",style: titleStyleTheam,),
                                        SizedBox(height: 10,),
                                        Text("srikonda@gmail.com",style: descriptionStyleDarkBlur ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Divider(
                                  color: Colors.black.withOpacity(0.9),
                                  thickness: 1,
                                ),
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 15,),
                                    Text("Contact No.",style: subTitleStyle,),
                                    SizedBox(height: 5,),
                                    Text("+91 9593131331",style: descriptionStyleDarkBlur ),
                                    SizedBox(height: 15,),
                                    Text("Gender",style: subTitleStyle,),
                                    SizedBox(height: 5,),
                                    Text("Male",style: descriptionStyleDarkBlur ),
                                    SizedBox(height: 15,),
                                    Text("Date of Birth",style: subTitleStyle,),
                                    SizedBox(height: 5,),
                                    Text("03/03/1998",style: descriptionStyleDarkBlur ),
                                    SizedBox(height: 15,),
                                    Text("Pan Card No.",style: subTitleStyle,),
                                    SizedBox(height: 5,),
                                    Text("BULPV4522",style: descriptionStyleDarkBlur ),
                                    SizedBox(height: 15,),
                                    Text("Aadhar Card No.",style: subTitleStyle,),
                                    SizedBox(height: 5,),
                                    Text("5462 4234 3244 3444",style: descriptionStyleDarkBlur ),

                                  ],
                                ),
                              ],
                            ) ,

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