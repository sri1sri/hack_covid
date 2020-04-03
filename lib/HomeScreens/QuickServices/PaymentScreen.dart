import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PaymentPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PaymentPage(),
    );
  }
}

class F_PaymentPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_PaymentPageState createState() => _F_PaymentPageState();
}

class _F_PaymentPageState extends State<F_PaymentPage> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final TextEditingController _cardNoController = TextEditingController();
  final FocusNode _cardNoFocusNode = FocusNode();
  final TextEditingController _expireController = TextEditingController();
  final FocusNode _expireFocusNode = FocusNode();
  final TextEditingController _cvvController = TextEditingController();
  final FocusNode _cvvFocusNode = FocusNode();
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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[

                    paymentCard(),
                    SizedBox(height: 20,),
                    Container(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                  builder: (context) => PrivacyPolicy(),
//                                ),
//                              );
                            },
                            child: Container(
                              height: 50,
//                        width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: subBackgroundColor,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'SAVE',
                                  style:
                                  subTextStylewhite
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        )
    );

  }

  Widget paymentCard()
  {
    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Total Premium To Pay",style: descriptionStyleDarkBlur ),
                    SizedBox(height: 10,),
                    Text("₹12,000",style: titleStyleTheam,),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.black.withOpacity(0.9),
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15,),
                  Text("Name on the Card",style: subTitleStyle,),
                  SizedBox(height: 20,),
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
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: subBackgroundColor
                          )
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: subBackgroundColor,
                      ),
                      labelText: "Enter Name On your Card",
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
                  Text("Card Number",style: subTitleStyle,),
                  SizedBox(height: 20,),
                  new TextFormField(
                    controller: _cardNoController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    focusNode: _cardNoFocusNode,
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    // onEditingComplete: () => _emailEditingComplete(),
                    // onChanged: model.updateEmail,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: subBackgroundColor
                          )
                      ),
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: subBackgroundColor,
                      ),
                      labelText: "Enter Card Number",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Exprires",style: subTitleStyle,),
                            SizedBox(
                              height: 10,
                            ),
                            new TextFormField(
                              controller: _expireController,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              focusNode: _expireFocusNode,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              // onEditingComplete: () => _emailEditingComplete(),
                              // onChanged: model.updateEmail,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: subBackgroundColor
                                    )
                                ),
                                prefixIcon: Icon(
                                  Icons.date_range,
                                  color: subBackgroundColor,
                                ),
                                labelText: "29/10/2020",
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
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("CVV",style: subTitleStyle,),
                            SizedBox(
                              height: 10,
                            ),
                            new TextFormField(
                              controller: _cvvController,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              focusNode: _cvvFocusNode,
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              // onEditingComplete: () => _emailEditingComplete(),
                              // onChanged: model.updateEmail,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: subBackgroundColor
                                    )
                                ),
                                prefixIcon: Icon(
                                  Icons.featured_play_list,
                                  color: subBackgroundColor,
                                ),
                                labelText: "***",
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
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ) ,

      ),
    );
  }

}