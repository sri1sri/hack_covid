import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PremiumPlans.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';


class InsurancePremiumPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_InsurancePremiumPage(),
    );
  }
}

class F_InsurancePremiumPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;


  @override
  _F_InsurancePremiumPageState createState() => _F_InsurancePremiumPageState();
}

class _F_InsurancePremiumPageState extends State<F_InsurancePremiumPage> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration inputDecoration1 = InputDecoration(
      hintText: 'Mumbai,Chennai...etc'

  );
  InputDecoration inputDecoration2 = InputDecoration(
      hintText: 'BMW,Audi,....etc'

  );
  InputDecoration inputDecoration3 = InputDecoration(
      hintText: 'A7,R8,i20....etc'

  );
  InputDecoration inputDecoration4 = InputDecoration(
      hintText: '2019'

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
//                      builder: (context) => SettingsPage() ),
//                );
              },
              primaryText: 'Insurance Premium',
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
                      Text("Get your car insurance premium",style: titleStyleTheam,),
                      SizedBox(height: 50,),
                      Text("Enter car registration city",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: inputDecoration1,
                        cursorColor: subBackgroundColor,
                      ),
                      SizedBox(height: 20,),
                      Text("Enter car name",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: inputDecoration2,
                        cursorColor: subBackgroundColor,
                      ),
                      SizedBox(height: 20,),
                      Text("Enter car model",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: inputDecoration3,
                        cursorColor: subBackgroundColor,
                      ),
                      SizedBox(height: 20,),
                      Text("Enter car purchased year",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      TextField(
                        decoration: inputDecoration4,
                        cursorColor: subBackgroundColor,
                      ),
                      SizedBox(height: 10,),
                      SizedBox(height: 50,),
                      ToDoButton(
                          assetName: 'images/googl-logo.png',
                          text: 'Submit',
                          textColor: Colors.white,
                          backgroundColor: backgroundColor,
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PremiumPlansPage() ),
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