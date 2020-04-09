import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_HowToUse(),
    );
  }
}

class F_HowToUse extends StatefulWidget {
  @override
  _F_HowToUse createState() => _F_HowToUse();
}

class _F_HowToUse extends State<F_HowToUse> {
  int _n = 0;
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);

  }

  Widget offlineWidget (BuildContext context){
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          leftActionBar: Container(
            child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
          ),
          leftAction: () {
            Navigator.pop(context, true);
          },
          rightActionBar: Container(
              child: Text(".............",style: TextStyle(color: Colors.white),)
          ),
          rightAction: () {
            print('right action bar is pressed in appbar');
          },
          primaryText: 'How To Use',
          secondaryText: null,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 10,),
              _Notificationcard("STEP 1"," Login to app using your phone number"),
              SizedBox(height: 10,),
              _Notificationcard("STEP 2","Open the app Open the app Open the app Open the app Open the app Open the app Open the app Open the app Open the app Open the app Open the app Open the app"),
              SizedBox(height: 10,),
              _Notificationcard("STEP 3","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 4","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 5","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 6","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 7","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 8","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 9","Open the app "),
              SizedBox(height: 10,),
              _Notificationcard("STEP 10","Open the app "),

            ],
          ),
        ),
      ),
    );
  }

  _Notificationcard(String step, String description)
  {
    return Container(

      child: Center(
        child: Card(
          child: Container(
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(step,
                    style: titleStyle,

                  ),
                  SizedBox(height: 15,),
                  Text(description,
                    style: descriptionStyle,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}