//import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/AuthenticationScreens/register_details.dart';
import 'package:hackcovid/AuthenticationScreens/email_authentaction_page.dart';
import 'package:hackcovid/AuthenticationScreens/register_account_page_model.dart';
import 'package:hackcovid/HomeScreens/home_page.dart';
//import 'package:covidapp/AuthenticationScreens/Verify_Otp.dart';
//import 'package:covidapp/Models/phone_number_page_model.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/loading_page.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
import 'package:hackcovid/firebase/auth.dart';
import 'package:hackcovid/model/email_sign_in_change_model.dart';
import 'package:hackcovid/model/validators.dart';
//import 'package:covidapp/firebase/auth.dart';

import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SignupPage.create(context),
    );
  }
}

class F_SignupPage extends StatefulWidget {
  F_SignupPage({@required this.model});
  final RegisterAccountPageModel model;

  static Widget create(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<RegisterAccountPageModel>(
      create: (context) => RegisterAccountPageModel(auth: auth),
      child: Consumer<RegisterAccountPageModel>(
        builder: (context, model, _) => F_SignupPage(model: model),
      ),
    );
  }
  
  @override
  _F_SignupPageState createState() => _F_SignupPageState();
}

class _F_SignupPageState extends State<F_SignupPage> {
  
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _rePasswordController = TextEditingController();
  final FocusNode _rePasswordFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  
  RegisterAccountPageModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _emailController.dispose();
    _rePasswordController.dispose();
    _passwordController.dispose();
    _rePasswordFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      GoToPage(context, RegisterDetails(email: _emailController.text,));
    } on PlatformException catch (e) {
      if(_emailController.text != '' && _passwordController.text != '' && _rePasswordController.text != '') {
        PlatformExceptionAlertDialog(
          title: 'SignUp Failed',
          exception: e,
        ).show(context);
      }
    }
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;

    FocusScope.of(context).requestFocus(newFocus);
  }

  void _passwordEditingComplete() {
    final newFocus = model.passwordValidator.isValid(model.password)
        ? _rePasswordFocusNode
        : _passwordFocusNode;

    FocusScope.of(context).requestFocus(newFocus);
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
      loading: widget.model.isLoading,
      child: Scaffold(
          body:Padding(
            padding: const EdgeInsets.only(top:100.0,bottom: 20,left: 20,right: 20),
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
                    Text("Sign Up",style: bigTitleStyle,),
                    SizedBox(height: 15.0,),
                    Text("Please enter your Password to continue.",style: descriptionStyleDarkBlur,),
                  ],
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
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        focusNode: _emailFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        onEditingComplete: () => _emailEditingComplete(),
                        onChanged: model.updateEmail,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: subBackgroundColor,
                          ),
                          labelText: "Email",
                          errorText: model.emailErrorText,
                          enabled: model.isLoading == false,
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
                    ),
                    SizedBox(height: 30.0,),
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
                        controller: _passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        focusNode: _passwordFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        onEditingComplete: () => _passwordEditingComplete(),
                        onChanged: model.updatePassword,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: subBackgroundColor,
                          ),
                          labelText: "Password",
                          errorText: model.passwordErrorText,
                          enabled: model.isLoading == false,
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
                    ),
                    SizedBox(height: 30.0,),
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
                        controller: _rePasswordController,
                        focusNode: _rePasswordFocusNode,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: _submit,
                        onChanged: model.updateRePassword,
                        decoration: new InputDecoration(
                          errorText: model.rePasswordErrorText,
                          enabled: model.isLoading == false,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: subBackgroundColor,
                          ),
                          labelText: "Confirm Password",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
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
                                      Text("Continue",style: activeSubTitleStyle),
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
                Column(
                  children: <Widget>[
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Already have an account?",
                        style: descriptionStyle
                    ),
                    FlatButton(
                      child: Text(
                        'Sign In',
                        style: subTitleStyleBlue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EmailAuthenticationPage(
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}