//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/loading_page.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
import 'package:hackcovid/firebase/api_path.dart';
import 'package:hackcovid/firebase/firestore_service.dart';
import 'package:hackcovid/model/user_details.dart';
import 'package:intl/intl.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../landing_page.dart';

class RegisterDetails extends StatelessWidget {

  RegisterDetails({@required this.email});
  String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_RegisterDetails(email: email),
    );
  }
}

class F_RegisterDetails extends StatefulWidget {

  F_RegisterDetails({@required this.email});
  String email;

  @override
  _F_RegisterDetailsState createState() => _F_RegisterDetailsState();
}

class _F_RegisterDetailsState extends State<F_RegisterDetails> {

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  int group = 1;

  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat("dd MMMM yyyy 'at' HH:mm:ss 'UTC+5:30'");
  var customFormat2 = DateFormat("dd MMMM yyyy");

  String _username;
  String _phoneNumber;
  String _aadharNumber;
  String _panCardNumber;

  String _drivingLicenceNumber;
  String _drivingLicenceYear;

  final FocusNode _drivingLicenceFocusNode = FocusNode();
  final FocusNode _drivingLicenceYearFocusNode = FocusNode();


  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _aadharFocusNode = FocusNode();
  final FocusNode _panCardFocusNode = FocusNode();

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
    _usernameFocusNode.dispose();
    _ageFocusNode.dispose();
    _aadharFocusNode.dispose();
    _phoneFocusNode.dispose();
    _panCardFocusNode.dispose();
    _drivingLicenceFocusNode.dispose();
    _drivingLicenceYearFocusNode.dispose();

    super.dispose();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {

    if (_validateAndSaveForm()) {
      setState(() {
        isLoading = true;
      });
      try {
        FirebaseUser user = await FirebaseAuth.instance.currentUser();
        final userDetails = UserDetails(
          username: _username,
          phoneNumber: '+91${_phoneNumber}',
          gender: group==1 ? 'male':'female',
          dateOfBirth: Timestamp.fromDate(selectedDate),
          joinedDate: Timestamp.fromDate(DateTime.now()),
          aadharCard: _aadharNumber,
          panCard: _panCardNumber,
          emailID: widget.email,
          drivingLicenseNumber: _drivingLicenceNumber,
          drivingLicenseYear: _drivingLicenceYear,
        );

        await FirestoreService.instance.setData(
          path: APIPath.userDetails(user.uid),
          data: userDetails.toMap(),
        );
        setState(() {
          isLoading = false;
        });
        GoToPage(context, LandingPage());

      } on PlatformException catch (e) {
        setState(() {
          isLoading = false;
        });
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
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
    return TransparentLoading(
      loading: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 80.0, bottom: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          size: 40,
                        ),
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Signup", style: bigTitleStyle),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Please Sign Up with your details.",
                      style: descriptionStyleDarkBlur,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _username = value,
                              textInputAction: TextInputAction.next,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _usernameFocusNode,
                              onFieldSubmitted: (value) => value == ''
                                  ? null
                                  : FocusScope.of(context)
                                      .requestFocus(_aadharFocusNode),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
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
                                  return 'Please enter username';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _aadharNumber = value,
                              textInputAction: TextInputAction.next,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _aadharFocusNode,
                              onFieldSubmitted: (value) => value == ''
                                  ? null
                                  : FocusScope.of(context)
                                      .requestFocus(_phoneFocusNode),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: subBackgroundColor,
                                ),
                                labelText: "Enter Aadhar number",
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
                                  return 'Please enter Aadhar number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _phoneNumber = value,
                              textInputAction: TextInputAction.next,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _phoneFocusNode,
                              onFieldSubmitted: (value) => value == ''
                                  ? null
                                  : FocusScope.of(context)
                                      .requestFocus(_panCardFocusNode),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
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
                                  return 'Please enter phone number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _panCardNumber = value,
                              textInputAction: TextInputAction.next,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _panCardFocusNode,
                              onFieldSubmitted: (value) => value == ''
                                  ? null
                                  : FocusScope.of(context)
                                  .requestFocus(_drivingLicenceFocusNode),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: subBackgroundColor,
                                ),
                                errorText: _panCardNumber == ''
                                    ? 'Please enter PAN card number'
                                    : null,
                                labelText: "Enter PAN card number",
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
                                  return 'Please enter PAN card number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _drivingLicenceNumber = value,
                              textInputAction: TextInputAction.next,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _drivingLicenceFocusNode,
                              onFieldSubmitted: (value) => value == ''
                                  ? null
                                  : FocusScope.of(context)
                                  .requestFocus(_drivingLicenceYearFocusNode),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: subBackgroundColor,
                                ),
                                labelText: "Enter Driving licence number",
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
                                  return 'Please enter Driving licence number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(3, 3),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0),
                                  BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.9),
                                      offset: Offset(-6, -2),
                                      blurRadius: 2.0,
                                      spreadRadius: 3.0)
                                ]),
                            child: TextFormField(
                              onChanged: (value) => _drivingLicenceYear = value,
                              textInputAction: TextInputAction.done,
                              autocorrect: true,
                              obscureText: false,
                              focusNode: _drivingLicenceYearFocusNode,
                              onEditingComplete: () => _submit(),
                              decoration: new InputDecoration(
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: subBackgroundColor,
                                ),
                                labelText: "Enter Driving licence issued year",
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
                                  return 'Please enter Driving licence issued year';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Gender",
                            style: subTitleStyleLight,
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
                            style: descriptionStyleDark,
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
                            style: descriptionStyleDark,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 10),
                        child: Container(
                          child: RaisedButton(
                            color: Colors.white,
                            child: Container(
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Select your date of birth.',
                                    style: subTitleStyleLight,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(""),
                          ),
                          GestureDetector(
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.all(15.0),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                    Container(),
                                    Text("SignUp", style: activeSubTitleStyle),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    Container(),
                                  ])),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: subBackgroundColor,
                                        offset: Offset(2, 1),
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0),
                                  ]),
                            ),
                            onTap: () {
                              _submit();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By continuing, You accept the Terms & Conditions Of the',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' Terms of use',
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' and',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' Privacy Policies',
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}