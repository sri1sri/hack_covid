import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PolicyRegistrationPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PolicyRegistrationPage(),
    );
  }
}

class F_PolicyRegistrationPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_PolicyRegistrationPageState createState() => _F_PolicyRegistrationPageState();
}

class _F_PolicyRegistrationPageState extends State<F_PolicyRegistrationPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF1F4B6E) : Color(0xFF1F4B6E).withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
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
                child: Text("........",style: TextStyle(color: Colors.white),),
              ),
              rightAction: () {
              },
              primaryText: 'Policy Details',
              secondaryText: null,
            ),
          ),
          body: ContSize(context,)
        )
    );

  }

  Widget ContSize(BuildContext context){
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0), // changed padding from 25 to 0
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 10,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 220,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/splash1.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                  height: MediaQuery.of(context).size.height/2,
                                  width: 500.0,
                                ),
                              ),

                              SizedBox(
                                  height:50),
                              Text(
                                'Smart Constructions',
                                style: titleStyle,
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Introducing smart, secure and advanced techniques into construction for better living.',
                                style: descriptionStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/splash2.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                  height: MediaQuery.of(context).size.height / 2,
                                  width: 500.0,
                                ),
                              ),
                              SizedBox(
                                  height:50),
                              Text(
                                'At your fingertips',
                                style: titleStyle,
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Monitor and Manage all construction activities at your fingertips',
                                style: descriptionStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/splash3.jpg',
                                  ),
                                  fit: BoxFit.fill,
                                  height: MediaQuery.of(context).size.height / 2,
                                  width: 500.0,
                                ),
                              ),
                              SizedBox(
                                  height:50),
                              Text(
                                'Secured Environment',
                                style: titleStyle,
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'your safety is utmost important so feel safe with our advanced security',
                                style: descriptionStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  _currentPage != _numPages - 1
                      ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:10.0,right: 10),
                        child: Container(
                          height: 80.0,
                          width: 150,
                          child: GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      "Next",
                                      style: subTextStylewhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages - 1
            ? Container(
          height:90,
          child: Padding(
            padding: const EdgeInsets.only(left:30.0,right:30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Text("Total Premium",style: subTextStyleBlue,),
                    Text("₹12,000",style: subTitleStyle,),
                  ],
                ),
                Container(
                  height: 50.0,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PolicyRegistrationPage() ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Proceed",
                              style: subTextStylewhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
            : Text(''),
      );
  }

}