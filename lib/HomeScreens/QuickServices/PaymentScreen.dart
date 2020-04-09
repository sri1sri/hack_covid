import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PaymentSuccess.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';

import '../../landing_page.dart';
import '../dashboard.dart';

class PaymentPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PaymentPage(),
    );
  }
}

class F_PaymentPage extends StatefulWidget {

  @override
  _F_PaymentPageState createState() => _F_PaymentPageState();
}

class _F_PaymentPageState extends State<F_PaymentPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _cardNoFocusNode = FocusNode();
  final FocusNode _expireFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();

  String _name;
  String _cardNumber;
  String _expireDate;
  String _cvv;

  final _formKey = GlobalKey<FormState>();


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
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
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
                child: Text(".....",style: TextStyle(color: Colors.white),)
              ),
              rightAction: () {
              },
              primaryText: 'Payment',
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: <Widget>[
                    paymentCard(),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            color: Colors.white,
            height:100,
            child: Padding(
              padding: const EdgeInsets.only(left:30.0,right:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 25,),
                      Text("Total Premium",style: subTextStyleBlue,),
                      Text("₹12,000",style: subTitleStyle,),
                    ],
                  ),
                  Container(
                    height: 50.0,
                    width: 150,
                    child: GestureDetector(
                      onTap: () {
                        _submit();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSuccess() ),
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
                                "Pay Now",
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
          ),
        )
    );

  }

  Widget paymentCard()
  {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 470,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 0,),
                    Text("Name on the Card",style: TextStyle(
                        color: backgroundColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,decoration: TextDecoration.none),),
                    SizedBox(height: 20,),

                    TextFormField(
                      onChanged: (value) => _name = value,
                      textInputAction: TextInputAction.next,
                      autocorrect: true,
                      obscureText: false,
                      focusNode: _nameFocusNode,
                      onFieldSubmitted: (value) => value == ''
                          ? null
                          : FocusScope.of(context)
                          .requestFocus(_cardNoFocusNode),
                      decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: subBackgroundColor,
                        ),
                        labelText: "Enter name",
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
                          return 'Please enter name on the card';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),
                    Text("Card Number",style: TextStyle(
                        color: backgroundColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,decoration: TextDecoration.none),),
                    SizedBox(height: 20,),

                    TextFormField(
                      onChanged: (value) => _cardNumber = value,
                      textInputAction: TextInputAction.next,
                      autocorrect: true,
                      obscureText: false,
                      focusNode: _cardNoFocusNode,
                      onFieldSubmitted: (value) => value == ''
                          ? null
                          : FocusScope.of(context)
                          .requestFocus(_expireFocusNode),
                      decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: subBackgroundColor,
                        ),
                        labelText: "Enter card number",
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
                          return 'Please enter card number';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Exprires",style: TextStyle(
                                  color: backgroundColor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,decoration: TextDecoration.none),),
                              SizedBox(height: 10,),

                              TextFormField(
                                onChanged: (value) => _expireDate = value,
                                textInputAction: TextInputAction.next,
                                autocorrect: true,
                                obscureText: false,
                                focusNode: _expireFocusNode,
                                onFieldSubmitted: (value) => value == ''
                                    ? null
                                    : FocusScope.of(context)
                                    .requestFocus(_cvvFocusNode),
                                decoration: new InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: subBackgroundColor,
                                  ),
                                  labelText: "mm/yy",
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
                                    return 'Please enter expire date';
                                  }
                                  return null;
                                },
                              ),

                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("CVV",style: TextStyle(
                                  color: backgroundColor,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,decoration: TextDecoration.none),),
                              SizedBox(height: 10),

                              TextFormField(
                                onChanged: (value) => _cvv = value,
                                textInputAction: TextInputAction.next,
                                autocorrect: true,
                                obscureText: false,
                                focusNode: _cvvFocusNode,
                                decoration: new InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.featured_play_list,
                                    color: subBackgroundColor,
                                  ),
                                  labelText: "Enter cvv",
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
                                    return 'Please enter cvv';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                  children: <Widget>[
                    Image.asset('images/applePay.png',height: 40,width: 40),
                    SizedBox(width: 20,),
                    Image.asset('images/americanExpress.png',height: 40,width: 40),
                    SizedBox(width: 20,),
                    Image.asset('images/paytm.png',height: 40,width: 40),
                    SizedBox(width: 20,),
                    Image.asset('images/mastercard.png',height: 40,width: 40),
                  ]),
                  ],
                ),
              ),
            ),

          ],
        ) ,

      ),
    );
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
      try {

        GoToPage(context, LandingPage());

      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
    }
  }
}