import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/InsurancePremium.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';


class CarInsurancePage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_CarInsurancePage(),
    );
  }
}

class F_CarInsurancePage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;


  @override
  _F_CarInsurancePageState createState() => _F_CarInsurancePageState();
}

class _F_CarInsurancePageState extends State<F_CarInsurancePage> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration inputDecoration1 = InputDecoration(
      hintText: 'Registration No.'

  );
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
          resizeToAvoidBottomPadding: false,
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
                child: Icon(Icons.list,color: subBackgroundColor,),
              ),
              rightAction: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => InsurancePremiumPage() ),
//                );
              },
              primaryText: 'Car Insurance',
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Text("Get what your car needs",style: titleStyleTheam,),
                      SizedBox(height: 50,),
                      Text("Enter car registration no.",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: inputDecoration1,
                        cursorColor: subBackgroundColor,
                      ),
                      SizedBox(height: 50,),
                      ToDoButton(
                          assetName: 'images/googl-logo.png',
                          text: 'Next',
                          textColor: Colors.white,
                          backgroundColor: backgroundColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InsurancePremiumPage() ),
                            );
                          }
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );

  }

}