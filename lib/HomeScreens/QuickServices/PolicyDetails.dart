import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PaymentReviewPage.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PaymentScreen.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/HomeScreens/viewPolicyDetails//policy_details.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
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

  String _ownerName;
  String _ownerEmail;
  String _ownerPhoneNumber;
  String _ownerPanCard;
  String _ownerLandmark;
  String _ownerGSTNumber;
  String _ownerLandlineNumber;

  String _nomineeName;

  String _address;
  String _city;
  String _state;
  String _pincode;

  String _carRegestrationNumber;
  String _previousInsurer;
  String _previousPolicyNumber;
  String _carEngineNumber;
  String _carChassisNumber;


  final FocusNode _ownerNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _panCardFocusNode = FocusNode();
  final FocusNode _landmarkFocusNode = FocusNode();
  final FocusNode _landLineFocusNode = FocusNode();
  final FocusNode _gstFocusNode = FocusNode();

  final FocusNode _nomNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _pincodeFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _carRegNoFocusNode = FocusNode();
  final FocusNode _preInsFocusNode = FocusNode();
  final FocusNode _prePolFocusNode = FocusNode();
  final FocusNode _carEngFocusNode = FocusNode();
  final FocusNode _carChaFocusNode = FocusNode();

  Color levelOne = Colors.grey[300];
  Color levelTwo = Colors.grey[300];
  Color levelThree = Colors.grey[300];
  
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


  @override
  void dispose() {

     _ownerNameFocusNode.dispose();
      _emailFocusNode.dispose();
      _phoneNumberFocusNode.dispose();
      _panCardFocusNode.dispose();
      _landmarkFocusNode.dispose();
      _landLineFocusNode.dispose();
      _gstFocusNode.dispose();
      _nomNameFocusNode.dispose();
      _addressFocusNode.dispose();
      _pincodeFocusNode.dispose();
      _cityFocusNode.dispose();
      _stateFocusNode.dispose();
      _carRegNoFocusNode.dispose();
      _preInsFocusNode.dispose();
      _prePolFocusNode.dispose();
      _carEngFocusNode.dispose();
      _carChaFocusNode.dispose();

    super.dispose();
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
          resizeToAvoidBottomPadding: false,
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
            body: ContSize(context,)
        )
    );

  }

  Widget ContSize(BuildContext context){
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
            onPressed: (){
              Navigator.pop(context, true);
            },
          ),
          title: Text("Policy Details",style: titleStyleTheam,),
        ),
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
                  statusTrackerWidget(levelOne, levelTwo, levelThree,),
                  SizedBox(height: 20,),

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
                        padding: const EdgeInsets.only(bottom:0.0,right: 10),
                        child: Container(
                          height: 50.0,
                          width: 150,
                          child: GestureDetector(
                            onTap: () {
                              print('currentPage == $_currentPage');
                              _submit(_currentPage);
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
          height:100,
          child: Padding(
            padding: const EdgeInsets.only(left:30.0,right:30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text("Total Premium",style: subTextStyleBlue,),
                    Text("₹12,000",style: subTitleStyle,),
                  ],
                ),
                Container(
                  height: 50.0,
                  width: 150,
                  child: GestureDetector(
                    onTap: () {

                      _submit(3);

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

  Widget statusTrackerWidget(Color levelOne, Color levelTwo, Color levelThree){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10,),
          Icon(Icons.person, color: backgroundColor, size: 28),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: new LinearPercentIndicator(
              width: 80,
              animation: true,
              lineHeight: 4.0,
              animationDuration: 3000,
              percent: 1,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: levelOne,
            ),
          ),
          Icon(Icons.people,color: backgroundColor ,size: 28,),
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
        Icon(Icons.add_location,color: backgroundColor ,size: 28,),
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
          Icon(Icons.directions_car,color: backgroundColor ,size: 28,),
          SizedBox(width: 10,),
        ],
      ),
    );
  }

  bool _validateAndSaveForm(int type) {
    final form = _formKey.currentState;
    final form1 = _formKey1.currentState;
    final form2 = _formKey2.currentState;
    final form3 = _formKey3.currentState;

    switch (type){
      case 0:
        if (form.validate()) {
          setState(() {
            levelOne = Colors.green;
          });
          form.save();
          return true;
        }
        return false;
        break;

      case 1:
        if (form1.validate()) {
          setState(() {
            levelTwo = Colors.green;
          });
          form1.save();
          return true;
        }
        return false;
        break;

      case 2:
        if (form2.validate()) {
          setState(() {
            levelThree = Colors.green;
          });
          form2.save();
          return true;
        }
        return false;
        break;

      case 3:
        if (form3.validate()) {
          form3.save();
          return true;
        }
        return false;
      break;
    }
  }

  Future<void> _submit(int type) async {
    if (_validateAndSaveForm(type)) {
      try {
        type == 3 ? isChecked == true ? GoToPage(context, PaymentReviewPage()) : PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: Exception('Please check the terms.'),
        ).show(context) : _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
    }
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

                        TextFormField(
                          onChanged: (value) => _ownerName = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _ownerNameFocusNode,
                          onFieldSubmitted: (value) => value == ''
                              ? null
                              : FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter username",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter owner name';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20,),
                        Text("Owner Email",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        TextFormField(
                          onChanged: (value) => _ownerEmail = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _emailFocusNode,
                          onFieldSubmitted: (value) => value == ''
                              ? null
                              : FocusScope.of(context)
                              .requestFocus(_phoneNumberFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter email",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter owner email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Text("Owner Phone Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),
                        TextFormField(
                          onChanged: (value) => _ownerPhoneNumber = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _phoneNumberFocusNode,
//                          onFieldSubmitted: (value) => value == ''
//                              ? null
//                              : FocusScope.of(context)
//                              .requestFocus(_emailFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter phone number",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter owner phone number';
                            }
                            return null;
                          },
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
                                                  style: TextStyle(
                                                      color: Color(0xFF253949),
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 18.0,decoration: TextDecoration.none)),
                                            ],
                                          ),
                                        ),
                                        Text('Change', style: TextStyle(
                                            color: Color(0xFF253949),
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,decoration: TextDecoration.none)),
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
                        TextFormField(
                          onChanged: (value) => _ownerPanCard = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _panCardFocusNode,
                          onFieldSubmitted: (value) => value == ''
                              ? null
                              : FocusScope.of(context)
                              .requestFocus(_landmarkFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.featured_play_list,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter PAN card number",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter PAN card number';
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: 20,),
                        Text("Enter Landmark",style: subTextStyleBlue),
                        SizedBox(height: 10,),

                        TextFormField(
                          onChanged: (value) => _ownerLandmark = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _landmarkFocusNode,
                          onFieldSubmitted: (value) => value == ''
                              ? null
                              : FocusScope.of(context)
                              .requestFocus(_gstFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter landmark",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter landmark';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Text("Enter GST Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),

                        TextFormField(
                          onChanged: (value) => _ownerGSTNumber = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _gstFocusNode,
                          onFieldSubmitted: (value) => value == ''
                              ? null
                              : FocusScope.of(context)
                              .requestFocus(_landmarkFocusNode),
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.donut_large,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter GST number",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter GST number';
                            }
                            return null;
                          },
                        ),


                        SizedBox(height: 20,),
                        Text("Enter Landline Number",style: subTextStyleBlue),
                        SizedBox(height: 10,),


                        TextFormField(
                          onChanged: (value) => _ownerLandlineNumber = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          obscureText: false,
                          focusNode: _landLineFocusNode,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.donut_large,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter landline number",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                          keyboardType: TextInputType.number,
                          keyboardAppearance: Brightness.dark,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter landline number';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 280,),
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

                          TextFormField(
                            onChanged: (value) => _nomineeName = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _nomNameFocusNode,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter nominee name",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter nominee name';
                              }
                              return null;
                            },
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
                          SizedBox(height: 350,),

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

                          TextFormField(
                            onChanged: (value) => _address = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _addressFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_cityFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.language,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Address",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20,),
                          Text("City",style: subTextStyleBlue),
                          SizedBox(height: 10,),

                          TextFormField(
                            onChanged: (value) => _city = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _cityFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_stateFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter city name",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter city name';
                              }
                              return null;
                            },
                          ),


                          SizedBox(height: 20,),
                          Text("State",style: subTextStyleBlue),
                          SizedBox(height: 10,),

                          TextFormField(
                            onChanged: (value) => _state = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _stateFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_pincodeFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.add_location,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter state",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter state';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20,),
                          Text("Pin Code",style: subTextStyleBlue),
                          SizedBox(height: 10,),

                          TextFormField(
                            onChanged: (value) => _pincode = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _pincodeFocusNode,
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.add_location,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter pincode",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter pincode';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 350,),

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
                          TextFormField(
                            onChanged: (value) => _carRegestrationNumber = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _carRegNoFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_preInsFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.keyboard,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter Car registration number",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Car registration number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20,),
                          Text("Previous Insurer",style: subTextStyleBlue),
                          SizedBox(height: 10,),


                          TextFormField(
                            onChanged: (value) => _previousInsurer = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _preInsFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_prePolFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter previous insurer name",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter previous insurer name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20,),
                          Text("Previous Policy No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),


                          TextFormField(
                            onChanged: (value) => _previousPolicyNumber = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _prePolFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_carEngFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.poll,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter previous policy number",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter previous policy number';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20,),
                          Text("Car Engine No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),

                          TextFormField(
                            onChanged: (value) => _carEngineNumber = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _carEngFocusNode,
                            onFieldSubmitted: (value) => value == ''
                                ? null
                                : FocusScope.of(context)
                                .requestFocus(_carChaFocusNode),
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.straighten,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter car engine number",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter car engine numberr';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20,),
                          Text("Car Chassis No.",style: subTextStyleBlue),
                          SizedBox(height: 10,),


                          TextFormField(
                            onChanged: (value) => _carChassisNumber = value,
                            textInputAction: TextInputAction.next,
                            autocorrect: false,
                            obscureText: false,
                            focusNode: _carChaFocusNode,

                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.confirmation_number,
                                color: subBackgroundColor,
                              ),
                              labelText: "Enter car chassis number",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter car chassis number';
                              }
                              return null;
                            },
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
                          SizedBox(height: 350,),
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