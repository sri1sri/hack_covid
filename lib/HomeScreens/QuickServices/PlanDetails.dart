import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/SeeAllCoverages.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PremiumPlanDetailsPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PremiumPlanDetailsPage(),
    );
  }
}

class F_PremiumPlanDetailsPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_PremiumPlanDetailsPageState createState() => _F_PremiumPlanDetailsPageState();
}

class _F_PremiumPlanDetailsPageState extends State<F_PremiumPlanDetailsPage> {
  int group =1;
  String dropdownValue = '1 Year';

  String textHolder = '+';

  changeText() {

    setState(() {
      textHolder = '✔';
    });

  }

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
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Text("Tenure",style: subTitleStyle,),
                    SizedBox(height: 15,),
                    Text("March 20, 2020 to April 20, 2020", style: descriptionStyleDarkBlur ,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Coverages",style: subTitleStyle,),
                        GestureDetector(
                            child: Text("See All",style: descriptionStyleDarkBlur ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeeAllCoveragesPage() ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Coverages("Third Party Liberties"),
                              SizedBox(width: 15,),
                              Coverages("Car Damage"),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Coverages("Personal Accident"),
                              SizedBox(width: 15,),
                              Coverages("Other Insurance"),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text("Add more Coverages",style: subTitleStyle,),
                    SizedBox(height: 25,),
                    Container(
                      child: Column(
                        children: <Widget>[
                          AddCoverageCard("Key protect cover","₹12,000"),
                          SizedBox(height: 10,),
                          AddCoverageCard("Engine Protect Plus","₹12,000"),
                          SizedBox(height: 10,),
                          AddCoverageCard("Garage cash","₹12,000"),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text("Had ZD in previous policy ?",style: subTitleStyle,),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Radio(
                          value: 1,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                        Text("Yes",style: subTitleStyleLight,),
                        Radio(
                          value: 2,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                        Text("No",style: subTitleStyleLight,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Waiver of PA Cover",style: subTitleStyle,),
                        DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['1 Year', '3 Years', '5 Years', '10 Years']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: contentStyle,),
                            );
                          })
                              .toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 60,),

                  ],
                ),
              ),
            ),
          ),
        )
    );

  }

  Widget Coverages(String Coverage)
  {
    return GestureDetector(
      child: Container(
        height:60,
        width: MediaQuery.of(context).size.width/2.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: subBackgroundColor.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Coverage,style: contentStyle,textAlign: TextAlign.center,)
          ],
        ),
      ),
      onTap: (){},
    );
  }
  Widget AddCoverageCard(String title,String price)
  {
    return GestureDetector(
      child: Container(
        height:60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: subBackgroundColor.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right:15,left:15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$textHolder',style: subTitleStyleLight,),
                  Text(title,style: contentStyle,),
                  Text(price,style:contentStyle),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () => changeText(),
    );
  }

}


