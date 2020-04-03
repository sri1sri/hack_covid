import 'dart:async';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hackcovid/HomeScreens/QuickServices/CarInsurance.dart';
import 'package:hackcovid/HomeScreens/profile.dart';
import 'package:hackcovid/HomeScreens/viepolicydetails/viewpolicydetailspage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackcovid/model/slideHome.dart';
import 'package:hackcovid/widgets/slide_dots.dart';
import 'package:hackcovid/widgets/slide_item_Home.dart';
import 'package:provider/provider.dart';

void GoToPage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (context) => page,
    ),
  );
}


class Dashboard extends StatelessWidget {
 // Dashboard({@required this.database});

  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_Dashboard(),
    );
  }
}

class F_Dashboard extends StatefulWidget {
  //F_Dashboard({@required this.database});

 // Database database;

  @override
  _F_DashboardState createState() => _F_DashboardState();
}

class _F_DashboardState extends State<F_Dashboard> {

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
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

  var features = [
    "Car Insurance",
    "Air Insurance",
    "Bike Insurance",
    "Life Insurance",
  ];
  List<String> F_image = [
    "images/car-insurance.png",
    "images/travel-insurance.png",
    "images/motorcycle-2.png",
    "images/hospital.png",
  ];

  var features1 = [
    "Car Insurance",
    "Air Insurance",
    "Bike Insurance",
    "Life Insurance",
  ];
  List<String> F_image1 = [
    "images/car-insurance.png",
    "images/travel-insurance.png",
    "images/motorcycle-2.png",
    "images/hospital.png",
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

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight( 100 ),
            child: Container(
              color: Colors.white,
              height: MediaQuery
                  .of( context )
                  .size
                  .height / 3,
              width: MediaQuery
                  .of( context )
                  .size
                  .width,
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
                            padding: const EdgeInsets.only(left: 20.0 ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Hello",style: subTextStyleBlue,),
                                  Text(
                                    "Srivatsav Konda",
                                    style: topNavigationBarTitleStyle,
                                  ),
                                ] ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding:
                                  const EdgeInsets.only( bottom: 15, right: 10 ),
                                  child: CircleAvatar(
                                    child: Text(
                                      'SV',
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
                                      builder: (context) =>
                                          ProfilePage(),
                                    ),
                                  );
                            } ),
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
                        child: ListView(scrollDirection: Axis.horizontal, children: [
                          _buildImage1('images/ad1.jpg',),
                          _buildImage1('images/ad3.jpg',),
                          _buildImage1('images/ad4.jpg',),
                          _buildImage1('images/ad2.jpg',),
                        ])),
                    Text('Quick Services',
                        style: subTitleStyleLight
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: new GridView.builder(
                          itemCount: F_image.length,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 0
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return new GestureDetector(
                              child:
                              new Card(
                                elevation: 0.0,
                                child: new Container(
                                  alignment: Alignment.center,
                                  margin: new EdgeInsets.only(
                                      top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                                  child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      F_image[index],height: 60,
                                    ),
                                    SizedBox(height: 5,),
                                    new Text(
                                      features[index],
                                      style: descriptionStyleDark,
                                    ),

                                  ],
                                ),
                                ),
                              ),
                              onTap: () {
                                switch (features[index]) {
                                  case 'Car Insurance':
                                    {
                            GoToPage(
                                context,
                                CarInsurancePage(
                                ));
                                    }
                                    break;
                                  case 'Air Insurance':
                                    {
                                      GoToPage(
                                          context,
                                          Viewpolicydetails());
                                    }
                                    break;


                                  case 'Flight Insurance':
                                    {
//                            GoToPage(
//                                context,
//                                GoodsApprovalsPage(
//                                  database: widget.database,
//                                  employee: employee,
//                                ));
                                    }
                                    break;
                                  case 'Bike Insurance':
                                    {
//                            GoToPage(
//                                context,
//                                StorePage(
//                                  database: widget.database,
//                                  employee: employee,
//                                ));
                                    }
                                    break;

                                  case 'Life insurance':
                                    {
//                            GoToPage(
//                              context,
//                              InventoryPage(database: widget.database,),
//                            );
                                    }
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
                    SizedBox(height: 50,),
                    Text('Quick Services',
                        style: subTitleStyleLight
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: new GridView.builder(
                          itemCount: F_image1.length,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 0
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return new GestureDetector(
                              child:
                              new Card(
                                elevation: 0.0,
                                child: new Container(
                                  alignment: Alignment.center,
                                  margin: new EdgeInsets.only(
                                      top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        F_image1[index],height: 60,
                                      ),
                                      SizedBox(height: 5,),
                                      new Text(
                                        features1[index],
                                        style: descriptionStyleDark,
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                switch (features[index]) {
                                  case 'Car Insurance':
                                    {
                                      GoToPage(
                                          context,
                                          CarInsurancePage(
                                          ));
                                    }
                                    break;

                                  case 'Flight Insurance':
                                    {
//                            GoToPage(
//                                context,
//                                GoodsApprovalsPage(
//                                  database: widget.database,
//                                  employee: employee,
//                                ));
                                    }
                                    break;
                                  case 'Bike Insurance':
                                    {
//                            GoToPage(
//                                context,
//                                StorePage(
//                                  database: widget.database,
//                                  employee: employee,
//                                ));
                                    }
                                    break;

                                  case 'Life insurance':
                                    {
//                            GoToPage(
//                              context,
//                              InventoryPage(database: widget.database,),
//                            );
                                    }
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
                    SizedBox(height: 50,),
                    Container(
                        height: 180.0,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Column(
                           children: <Widget>[
                             Text("How likely are you to recomended our app to your peer group?",style: subTitleStyleWhiteContent,),
                             FormBuilderSlider(
                                 attribute: "slider",
                                 activeColor: subBackgroundColor,
                                 inactiveColor: Colors.white,
                                 validators: [FormBuilderValidators.min(6)],
                                 min: 0.0,
                                 max: 9.0,
                                 initialValue: 1.0,
                                 divisions: 9,
                               ),
                             SizedBox(height: 5,),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: <Widget>[
                                 Text("Total Responses: 10,000",style: subTitleStyleWhiteContent,)
                               ],
                             )
                           ],
                         ),
                       ),
                    ),
                    SizedBox(height: 70,),

                  ],
                ),
              ),
            ],
          ),

        ),
    ),
        );
  }
  _buildImage1(String imgPath,) {
    return FlatButton(
      onPressed: () {
      },

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
