import 'dart:async';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hackcovid/HomeScreens/QuickServices/CarInsurance.dart';
import 'package:hackcovid/HomeScreens/profile.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/NoAccessPage.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/list_item_builder/list_items_builder.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackcovid/firebase/database.dart';
import 'package:hackcovid/model/responsesDetails.dart';
import 'package:hackcovid/model/user_details.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

import 'quick_services_page.dart';

//Database db;

class Dashboard extends StatelessWidget {
  Dashboard({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_Dashboard(
        database: database,
      ),
    );
  }
}

class F_Dashboard extends StatefulWidget {
  F_Dashboard({@required this.database});

  Database database;

  @override
  _F_DashboardState createState() => _F_DashboardState();
}

class _F_DashboardState extends State<F_Dashboard> {
  String submitText = 'Submit';
  double rating = 0.0;

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
//    db = widget.database;
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    print('rrrrrrr$USER_ID');
    if(USER_ID == '5m8VifljRZOmyk7mMDgxGTeJELf2'){

      LATITUDE =18.5204;
      LONGITUDE=73.8567;
    }


  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  var ourProducts = [
    "Car Insurance",
    "",
    "Bike Insurance",
  ];
  List<String> ourProductsIcons = [
    "images/car-insurance.png",
    "images/travell-insurance.png",
    "images/motorcycle-2.png",
  ];

  var quickServices = [
    "Garage",
    "Parking",
    "SOS",
    "Helpline",
    "CO2 emission",
  ];
  List<String> quickServicesIcons = [
    "images/garage.png",
    "images/parking.png",
    "images/sos.png",
    "images/helpline.png",
    "images/co2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Scaffold(
          body: _buildContent(context),
        ),
      ),
    );
  }

  @override
  Widget _buildContent(BuildContext context) {
    return StreamBuilder<UserDetails>(
        stream: widget.database.readUser(USER_ID),
        builder: (context, snapshot) {
          final userData = snapshot.data;
          userData != null
              ? USERNAME = userData.username
              : USERNAME = 'fetching...';

          print('USER__ID$USER_ID');
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Hello",
                                      style: subTextStyleBlue,
                                    ),
                                    Text(
                                      userData == null ? "" : userData.username[0].toUpperCase() + userData.username.substring(1),
                                      style: topNavigationBarTitleStyle,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: GestureDetector(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, right: 10),
                                    child: CircleAvatar(
                                      child: Text(
                                        userData == null
                                            ? "-"
                                            : userData.username[0].toUpperCase(),
                                        style: subTitleStyleLight,
                                      ),
                                      radius: 20.0,
                                      backgroundColor:
                                          subBackgroundColor.withOpacity(0.3),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      database: widget.database,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 282.0,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _buildImage1(
                                      'images/ad1.jpg',
                                    ),
                                    _buildImage1(
                                      'images/ad3.jpg',
                                    ),
                                    _buildImage1(
                                      'images/ad4.jpg',
                                    ),
                                    _buildImage1(
                                      'images/ad2.jpg',
                                    ),
                                  ])),
//                    Container(
//                      decoration: BoxDecoration(
//                        color: Colors.black,
//                        borderRadius: BorderRadius.circular(10.0),),
//                      child: Card(
//
//                      ),
//                    ),
                          Card(
                            elevation: 25,
                            shape: RoundedRectangleBorder(
//                    side: BorderSide(color: Colors.black54, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                color: Color(0xFF5454D3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('  Our products',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0)),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 120,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            left: 5.0,
                                            right: 5.0),
                                        child: new GridView.builder(
                                          itemCount: ourProductsIcons.length,
                                          gridDelegate:
                                              new SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 6,
                                                  crossAxisSpacing: 0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return new GestureDetector(
                                              child: new Card(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                child: new Container(
                                                  alignment: Alignment.center,
                                                  margin: new EdgeInsets.only(
                                                      top: 0.0,
                                                      bottom: 0.0,
                                                      left: 0.0,
                                                      right: 0.0),
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        ourProductsIcons[index],
                                                        height: 56,
                                                      ),
                                                      new Text(
                                                        ourProducts[index],
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          height: 1.5,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                switch (ourProducts[index]) {
                                                  case 'Car Insurance':
                                                    {
                                                      GoToPage(
                                                          context,
                                                          CarInsurancePage(
                                                            database:
                                                                widget.database,
                                                          ));
                                                    }
                                                    break;
                                                  case 'Travel Insurance':
                                                    {
                                                      GoToPage(context,
                                                          NoAccessPage());
                                                    }
                                                    break;

                                                  case 'Bike Insurance':
                                                    {
                                                      GoToPage(context,
                                                          NoAccessPage());
                                                    }
                                                    break;
                                                  case 'Bike Insurance':
                                                    {}
                                                    break;

                                                  case 'Life insurance':
                                                    {}
                                                    break;
                                                  default:
                                                    {}
                                                    break;
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),

                          Card(
                            elevation: 25,
                            shape: RoundedRectangleBorder(
//                    side: BorderSide(color: Colors.black54, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 325,
                              decoration: BoxDecoration(
                                color: Color(0xFF5454D3),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text('  Quick Services',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0)),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 260,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 10.0,
                                            left: 5.0,
                                            right: 5.0),
                                        child: new GridView.builder(
                                          itemCount: quickServicesIcons.length,
                                          gridDelegate:
                                              new SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 8,
                                                  crossAxisSpacing: 0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return new GestureDetector(
                                              child: new Card(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                child: new Container(
                                                  alignment: Alignment.center,
                                                  margin: new EdgeInsets.only(
                                                      top: 0.0,
                                                      bottom: 0.0,
                                                      left: 0.0,
                                                      right: 0.0),
                                                  child: new Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Image.asset(
                                                        quickServicesIcons[
                                                            index],
                                                        height: 56,
                                                      ),
                                                      new Text(
                                                        quickServices[index],
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          height: 1.5,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () async {
                                                switch (quickServices[index]) {
                                                  case 'Garage':
                                                    {
                                                      GoToPage(
                                                          context,
                                                          QuickService(
                                                            serviceType:
                                                                'garage',
                                                          ));
                                                    }
                                                    break;

                                                  case 'Parking':
                                                    {
                                                      GoToPage(
                                                          context,
                                                          QuickService(
                                                            serviceType:
                                                                'parking',
                                                          ));
                                                    }
                                                    break;
                                                  case 'SOS':
                                                    {
                                                      GoToPage(
                                                          context,
                                                          QuickService(
                                                            serviceType:
                                                                'hospitals%20and%20clinic',
                                                          ));
                                                    }
                                                    break;

                                                  case 'Helpline':
                                                    {
                                                      //  await launch("https://wa.me/917875483869?text=Welcome%20to%20Hack%20Covid.%20Please%20type%20your%20qurey%20and%20send%20us.%20We%20will%20get%20back%20to%20you%20shortly.");

//                                                    var whatsappUrl ="whatsapp://send?phone=${'8333876209'}&text=${'jhhhuhuhu'}";
//                                                    await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");

                                                      FlutterOpenWhatsapp
                                                          .sendSingleMessage(
                                                              "917875483869",
                                                              "Welcome%20to%20Dove%20Wheels.%20Please%20type%20your%20qurey%20and%20send%20us.%20We%20will%20get%20back%20to%20you%20shortly.");
                                                    }
                                                    break;

                                                  case 'CO2 emission':
                                                    {}
                                                    break;
                                                  default:
                                                    {}
                                                    break;
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 280.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF5454D3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: StreamBuilder<List<ResponseDetails>>(
                                    stream: widget.database.readResponses(),
                                    builder: (context, snapshots) {
                                      return Column(
                                        children: <Widget>[
                                          Text(
                                            "How likely are you to recomended our app to your peer group?",
                                            style: subTitleStyleWhiteContent,
                                          ),
                                          FormBuilderSlider(
                                            attribute: "slider",
                                            activeColor: subBackgroundColor,
                                            inactiveColor: Colors.white,
                                            validators: [
                                              FormBuilderValidators.min(6)
                                            ],
                                            min: 0.0,
                                            max: 10.0,
                                            initialValue: 0.0,
                                            divisions: 10,
                                            onChanged: (value) {
                                              setState(() {
                                                rating = value;
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                "Total Responses: ${snapshots
                                                    .data.length}",
                                                style:
                                                subTitleStyleWhiteContent,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              ToDoButton(
                                                  assetName:
                                                  'images/googl-logo.png',
                                                  text: submitText,
                                                  textColor:
                                                  Color(0xFF5454D3),
                                                  backgroundColor:
                                                  Colors.white,
                                                  onPressed: () async {
                                                    if (submitText ==
                                                        'Submit') {
                                                      final _responseDetails =
                                                      ResponseDetails(
                                                        userID: USER_ID,
                                                        rating:
                                                        rating.toInt(),
                                                      );

                                                      await widget.database
                                                          .setResonse(
                                                          _responseDetails);
                                                      setState(() {
                                                        submitText =
                                                        'Submitted';
                                                      });
                                                    } else {
                                                      setState(() {
                                                        submitText =
                                                        'Already submitted';
                                                      });
                                                    }
                                                  }),
                                            ],
                                          )
                                        ],
                                      );
                                    }

                                    )
          ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _buildImage1(
    String imgPath,
  ) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.only(
        top: 25,
      ),
      child: Container(
          height: 230,
          width: 370,
          child: Column(children: <Widget>[
            Stack(children: [
              Container(
                height: 230.0,
              ),
              Positioned(
                  left: 10.0,
                  right: 10.0,
                  top: 5.0,
                  bottom: 30.0,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 120.0,
                        width: 220.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(imgPath), fit: BoxFit.fill))),
                  )),
            ]),
          ])),
    );
  }
}