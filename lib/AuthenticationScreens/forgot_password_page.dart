import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/dashboard.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/loading_page.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
import 'package:hackcovid/firebase/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../landing_page.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return F_ForgotPassword();
  }
}

class F_ForgotPassword extends StatefulWidget {
  @override
  _F_ForgotPasswordState createState() => _F_ForgotPasswordState();
}

class _F_ForgotPasswordState extends State<F_ForgotPassword> {

  final _formKey = GlobalKey<FormState>();

  String _email;
  bool isLoading = false;

  final FocusNode _emailFocusNode = FocusNode();

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
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
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

  Widget offlineWidget (BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB( 0, 0, 0, 0 ),
        child: Scaffold(
          body:_buildContent( context ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {

    return TransparentLoading(
      loading: isLoading,
      child:Scaffold(
        body:Padding(
          padding: const EdgeInsets.only(top:80.0,bottom: 20,left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(Icons.arrow_back,size: 40,),
                        onTap: (){Navigator.pop(context, true);},
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Forgot Password",style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0,decoration: TextDecoration.none),),
                    SizedBox(height: 15.0,),
//                    Text("Please enter your Email Id and Password to continue.",style: descriptionStyleDarkBlur,),
                  ],
                ),

                Form(
                  key: _formKey,
                  child: Column(
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
                                  spreadRadius: 2.0
                              ),
                              BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.9),
                                  offset: Offset(-6, -2),
                                  blurRadius: 2.0,
                                  spreadRadius: 3.0
                              )
                            ]
                        ),
                        child: new TextFormField(
                          onChanged: (value) => _email = value,
                          textInputAction: TextInputAction.next,
                          autocorrect: true,
                          obscureText: false,
                          focusNode: _emailFocusNode,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
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
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 30.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "Entered email will get a reset link.",
                              style: descriptionStyle
                          ),
                        ],
                      ),

                      SizedBox(height: 30.0,),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(child: Text(""),),
                          GestureDetector(
                            child: Container(
                              width: 200,
                              padding: EdgeInsets.all(15.0),
                              child: Center(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(),
                                        Text("Send",style: activeSubTitleStyle),
                                        Icon(Icons.arrow_forward,color: Colors.white,),
                                        Container(),
                                      ])),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: subBackgroundColor,
                                        offset: Offset(2,1),
                                        blurRadius: 6.0,
                                        spreadRadius: 1.0
                                    ),

                                  ]
                              ),
                            ),
                            onTap: (){
                              _submit();
                            },
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[

                    SizedBox(height: 40,)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

