import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PaymentScreen.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  int group = 1;
  int group1 = 1;
  int group2 = 1;

  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final TextEditingController _panCardController = TextEditingController();
  final FocusNode _panCardFocusNode = FocusNode();
  final TextEditingController _landmarkController = TextEditingController();
  final FocusNode _landmarkFocusNode = FocusNode();
  final TextEditingController _landLineController = TextEditingController();
  final FocusNode _landLineFocusNode = FocusNode();
  final TextEditingController _gstController = TextEditingController();
  final FocusNode _gstFocusNode = FocusNode();
  final TextEditingController _nomNameController = TextEditingController();
  final FocusNode _nomNameFocusNode = FocusNode();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _addressFocusNode = FocusNode();
  final TextEditingController _pincodeController = TextEditingController();
  final FocusNode _pincodeFocusNode = FocusNode();
  final TextEditingController _cityController = TextEditingController();
  final FocusNode _cityFocusNode = FocusNode();
  final TextEditingController _stateController = TextEditingController();
  final FocusNode _stateFocusNode = FocusNode();
  final TextEditingController _carRegNoController = TextEditingController();
  final FocusNode _carRegNoFocusNode = FocusNode();
  final TextEditingController _preInsController = TextEditingController();
  final FocusNode _preInsFocusNode = FocusNode();
  final TextEditingController _prePolController = TextEditingController();
  final FocusNode _prePolFocusNode = FocusNode();
  final TextEditingController _carEngController = TextEditingController();
  final FocusNode _carEngFocusNode = FocusNode();
  final TextEditingController _carChaController = TextEditingController();
  final FocusNode _carChaFocusNode = FocusNode();
  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat("dd MMMM yyyy 'at' HH:mm:ss 'UTC+5:30'");
  var customFormat2 = DateFormat("dd MMMM yyyy");
  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1930),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      setState(() {
        print(customFormat.format(picked));
        selectedDate = picked;
      });
    }
  }
  final int _numPages = 4;
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
      width: isActive ? 34.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF1F4B6E) : Color(0xFF1F4B6E).withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  bool isChecked = false;

  var resultHolder = "Check the terms before agreeing";

  void toggleCheckbox(bool value) {

    if(isChecked == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = "I'am agreeing to all the terms";
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Check the terms before agreeing';
      });
    }
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
                  statusTrackerWidget(Colors.green, Colors.green,
                      Colors.green, Colors.green,),
//                  Container(
//                    height: 10,
//                    child: Row(
//
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: _buildPageIndicator(),
//                    ),
//                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        CarOwnerDetails(context),
                        NominieeDetails(context),
                        CommunicationDetails(context),
                        CarDetails(context)
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
                              print('current Page ${_currentPage}');
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
                            builder: (context) => PaymentPage() ),
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

//  Widget _trackGoodsStatus(String data) {
//    switch (String data) {
//      case 0:
//        return _statusTracker(data, Colors.green, Colors.orangeAccent,
//            Colors.grey, Colors.grey, Colors.grey);
//        break;
//
//      case 1:
//        return _statusTracker(data, Colors.green, Colors.green, Colors.orangeAccent,
//            Colors.grey, Colors.grey);
//        break;
//
//      case 2:
//        return _statusTracker(data, Colors.green, Colors.green, Colors.green,
//            Colors.orangeAccent, Colors.grey);
//        break;
//
//      case 3:
//        return _statusTracker(data, Colors.green, Colors.green, Colors.green,
//            Colors.green, Colors.orangeAccent);
//        break;
//      case 4:
//        return _statusTracker(data, Colors.green, Colors.green, Colors.green,
//            Colors.green, Colors.green);
//        break;
//    }
//  }

  Widget statusTrackerWidget(Color levelOne, Color levelTwo, Color levelThree, Color levelFour){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10,),
          Icon(Icons.person, color: levelOne, size: 30),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: new LinearPercentIndicator(
              width: 80,
              animation: true,
              lineHeight: 4.0,
              animationDuration: 3000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: levelTwo,
            ),
          ),
          Icon(Icons.person,color: levelOne ,size: 30,),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: new LinearPercentIndicator(
              width: 80,
              animation: true,
              lineHeight: 4.0,
              animationDuration: 3000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: levelThree,
            ),
          ),
        Icon(Icons.person,color: levelOne ,size: 30,),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: new LinearPercentIndicator(
              width: 80,
              animation: true,
              lineHeight: 4.0,
              animationDuration: 3000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: levelFour,
            ),
          ),
          Icon(Icons.person,color: levelOne ,size: 30,),
          SizedBox(width: 10,),
        ],
      ),
    );
  }

  Widget CarOwnerDetails(BuildContext context)
  {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Text("Car Owner Details",style: titleStyleTheam,),
                        SizedBox(height: 40,),
                        Text("Owner Name",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _nameFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter Owner Name",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Owner Email",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _emailFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter Owner Email",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Owner Phone Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _phoneController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _phoneFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter Phone Number",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Date of Birth",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.only(top: 0, bottom: 10),
                          child: Container(
                            child: RaisedButton(
                              color: Colors.white,
                              child: Container(
                                height: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.date_range,
                                                size: 18.0,
                                                color: backgroundColor,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  '${customFormat2.format(selectedDate)}',
                                                  style: subTitleStyle),
                                            ],
                                          ),
                                        ),
                                        Text('Change', style: subTitleStyle),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () => showPicker(context),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Gender",style: subTextStyleBlue),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
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
                            Text(
                              "Male",
                              style: subTitleStyleLight,
                            ),
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
                            Text(
                              "Female",
                              style: subTitleStyleLight,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Text("Pan Card Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _panCardController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _panCardFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.featured_play_list,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter Pan Number",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Enter Landmark",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _landmarkController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _landmarkFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: subBackgroundColor,
                            ),
                            labelText: "Landmark",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Enter GST Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _gstController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _gstFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.donut_large,
                              color: subBackgroundColor,
                            ),
                            labelText: "GST",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Enter Landline Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        new TextFormField(
                          controller: _landLineController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          focusNode: _landLineFocusNode,
                          autocorrect: false,
                          keyboardType: TextInputType.phone,
                          // onEditingComplete: () => _emailEditingComplete(),
                          // onChanged: model.updateEmail,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: subBackgroundColor,
                            ),
                            labelText: "Landline",
                            //errorText: model.emailErrorText,
                            //enabled: model.isLoading == false,
                            //fillColor: Colors.redAccent,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: 80,),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
        );
      },
    );
  }
  Widget NominieeDetails(BuildContext context)
  {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Text("Nominee's Details",style: titleStyleTheam,),
                          SizedBox(height: 40,),
                          Text("Nominee Name",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _nomNameController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _nomNameFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Nominee Name",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Date of Birth",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(top: 0, bottom: 10),
                            child: Container(
                              child: RaisedButton(
                                color: Colors.white,
                                child: Container(
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.date_range,
                                                  size: 18.0,
                                                  color: backgroundColor,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    '${customFormat2.format(selectedDate)}',
                                                    style: subTitleStyle),
                                              ],
                                            ),
                                          ),
                                          Text('Change', style: subTitleStyle),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () => showPicker(context),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Nominee Relationship",style: subTextStyleBlue),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: group1,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group1=T;
                                  });
                                },
                              ),
                              Text(
                                "Father",
                                style: subTitleStyleLight,
                              ),
                              Radio(
                                value: 2,
                                groupValue: group1,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group1=T;
                                  });
                                },
                              ),
                              Text(
                                "Mother",
                                style: subTitleStyleLight,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 3,
                                groupValue: group1,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group1=T;
                                  });
                                },
                              ),
                              Text(
                                "Spouse",
                                style: subTitleStyleLight,
                              ),
                              Radio(
                                value: 4,
                                groupValue: group1,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group1=T;
                                  });
                                },
                              ),
                              Text(
                                "Other",
                                style: subTitleStyleLight,
                              ),
                            ],
                          ),
                          SizedBox(height: 80,),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
        );
      },
    );
  }
  Widget CommunicationDetails(BuildContext context)
  {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Text("Communication Address",style: titleStyleTheam,),
                          SizedBox(height: 40,),
                          Text("Address",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _addressController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _addressFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.language,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Address",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("City",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _cityController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _cityFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter City",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("State",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _stateController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _stateFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.add_location,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter State",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Pin Code",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _pincodeController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _pincodeFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.phone,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.pin_drop,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Pin Code",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 80,),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
        );
      },
    );
  }
  Widget CarDetails(BuildContext context)
  {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Text("Car Details",style: titleStyleTheam,),
                          SizedBox(height: 40,),
                          Text("Car Registration No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _carRegNoController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _carRegNoFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.keyboard,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Registration Number",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Previous Insurer",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _preInsController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _preInsFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Insurer Name",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Previous Policy No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _prePolController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _prePolFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.poll,
                                color: subBackgroundColor,
                              ),
                              labelText: "Policy Number",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Car Engine No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _carEngController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _carEngFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.straighten,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Engine Number",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Car Chassis No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),
                          new TextFormField(
                            controller: _carChaController,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            focusNode: _carChaFocusNode,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            // onEditingComplete: () => _emailEditingComplete(),
                            // onChanged: model.updateEmail,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.confirmation_number,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Pin Code",
                              //errorText: model.emailErrorText,
                              //enabled: model.isLoading == false,
                              //fillColor: Colors.redAccent,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text("Hypothecation/Loan",style: subTextStyleBlue),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: group2,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group2=T;
                                  });
                                },
                              ),
                              Text(
                                "Hypothecation",
                                style: subTitleStyleLight,
                              ),
                              Radio(
                                value: 2,
                                groupValue: group2,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group2=T;
                                  });
                                },
                              ),
                              Text(
                                "Lease",
                                style: subTitleStyleLight,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 3,
                                groupValue: group2,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group2=T;
                                  });
                                },
                              ),
                              Text(
                                "Hire Purchase",
                                style: subTitleStyleLight,
                              ),
                              Radio(
                                value: 4,
                                groupValue: group2,
                                onChanged: (T){
                                  print(T);
                                  setState(() {
                                    group2=T;
                                  });
                                },
                              ),
                              Text(
                                "Others",
                                style: subTitleStyleLight,
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                         Row(
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[ Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  value: isChecked,
                                  onChanged: (value){toggleCheckbox(value);},
                                  activeColor: backgroundColor,
                                  checkColor: Colors.white,
                                  tristate: false,
                                ),
                              ),
                              ]),
                          Column(
                            children: <Widget>[
                              Text('$resultHolder', style: descriptionStyleDark)
                            ],
                          )
                        ],
                      ),
                          SizedBox(height: 100,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
        );
      },
    );
  }


}