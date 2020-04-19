import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/viewPolicyDetails//view_policy_details_page.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:flare_flutter/flare_actor.dart';

class PoliciesPage extends StatelessWidget {
  PoliciesPage({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PoliciesPage(database:database),
    );
  }
}

class F_PoliciesPage extends StatefulWidget {
   F_PoliciesPage({@required this.database});
   Database database;

  @override
  _F_PoliciesPageState createState() => _F_PoliciesPageState();
}

class _F_PoliciesPageState extends State<F_PoliciesPage> {

  List<String>accessID = ['wX7kPQZ1jkQbILzyMFnjqjKaYwJ2', '5m8VifljRZOmyk7mMDgxGTeJELf2', 'bxsQ9zyIubUdYV7atWQxezLNsTG2', 'lzYMjy1oBIaR5vslWOHFpg5Svtv1'];

  @override
  Widget build(BuildContext context) {
//    USER_ID = '5m8VifljRZOmyk7mMDgxGTeJELf2';
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
          backgroundColor: Colors.white,
          body: accessID.contains(USER_ID) ? SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Column(
                      children: <Widget>[
                        Text("Policies",style: topNavigationBarTitleStyle,)
                      ],
                    ),
                    SizedBox(height: 30,),
                    PolicyCard("images/car-insurance.png","TN 66 V 6571","532FTFC7642VJ"),
                    SizedBox(height: 10,),
                    PolicyCard("images/car-insurance.png","AP 22 TS 3244","JHDJ78472BCCN"),
                    SizedBox(height: 10,),
                    PolicyCard("images/car-insurance.png","KL 43 ED 4734","73478HJSBFFJFF"),
                    SizedBox(height: 10,),
                    PolicyCard("images/car-insurance.png","MH 33 DA 8746","HFD7745342VEFF"),
                    SizedBox(height: 10,),
                    PolicyCard("images/car-insurance.png","TS 87 JS 0343","SAK328746SAAD"),
                  ],
                ),
              ),
            ),
          ) : SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("P0licies",style: topNavigationBarTitleStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('You have no\npolicies with us....!',style: titleStyle,),
                    ),
                    SizedBox(
                      width: 600.0,
                      height: 700.0,
                      child: FlareActor("images/dash-2.flr", alignment:Alignment.topLeft, fit:BoxFit.contain, animation:'Untitled'),
                    ),
                    //Splash(),
                  ],
                ) ,
              ),
            ),
          ),
        )
    );

  }

  Widget PolicyCard(String imgPath,String carReg,String polNo)
  {
    return GestureDetector(
      child: Card(
        elevation: 0,
        child: Container(
          child:Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage(imgPath),
                            radius: 25,
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(carReg,style: highlighttitle,),
                            SizedBox(height: 2,),
                            Text(polNo,style: descriptionStyleDarkBlur1,),
                          ]
                      ),
                    ],
                  ),
                  Text("View",style: statusTracker,),
                ]
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewPolicyDetails() ),
        );
      },
    );
  }

}
