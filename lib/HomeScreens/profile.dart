import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:hackcovid/model/user_details.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ProfilePage(database: database,),
    );
  }
}

class F_ProfilePage extends StatefulWidget {
  F_ProfilePage({@required this.database});
  Database database;

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

    return StreamBuilder<UserDetails>(
      stream: widget.database.readUser(USER_ID),
      builder: (context, snapshot) {

    final userData = snapshot.data;

    return new MaterialApp(
                debugShowCheckedModeBanner: false,
                home: new Scaffold(
                  backgroundColor:Colors.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/6.5),
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: <Widget>[
                              Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black54, width: 3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  height: 700,
                                  decoration: BoxDecoration(
                                    color: subBackgroundColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.0),),
                                  child:Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Center(
                                            child: CircleAvatar(
                                              child: Text(
                                                userData == null ? "" : userData.username[0],
                                                style: titleStylelight,
                                              ),
                                              radius: 50.0,
                                              backgroundColor:
                                              subBackgroundColor,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(userData == null ? "" : userData.username[0].toUpperCase() + userData.username.substring(1),style: titleStyleTheam,),
                                              SizedBox(height: 10,),
                                              Text(userData == null ? "" : userData.emailID,style: descriptionStyleDarkBlur ),
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
                                          Text("${userData == null ? "" : userData.phoneNumber}",style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Gender",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text(userData == null ? "" : userData.gender,style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Date of Birth",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text('${getDate((userData == null ? 0 : userData.dateOfBirth.seconds))}',style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Pan Card No.",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text(userData == null ? "" : userData.panCard,style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Aadhar Card No.",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text(userData == null ? "" : userData.aadharCard,style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Driving Licence No.",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text(userData == null ? "" : userData.drivingLicenseNumber,style: descriptionStyleDarkBlur ),
                                          SizedBox(height: 15,),
                                          Text("Driving Licence issued year",style: subTitleStyle,),
                                          SizedBox(height: 5,),
                                          Text(userData == null ? "" : userData.drivingLicenseYear,style: descriptionStyleDarkBlur ),


                                        ],
                                      ),
                                    ],
                                  ) ,

                                ),
                              ),
                              SizedBox(height: 15,),
                              GestureDetector(
                                  child: Text("Edit Profie",style: titleStyleTheam,),
                                onTap: (){},
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                )
              );
      }
    );

  }

}