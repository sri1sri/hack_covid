import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PremiumPlans.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';


class InsurancePremiumPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_InsurancePremiumPage(),
    );
  }
}

class F_InsurancePremiumPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;


  @override
  _F_InsurancePremiumPageState createState() => _F_InsurancePremiumPageState();
}

class _F_InsurancePremiumPageState extends State<F_InsurancePremiumPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _regCityController = TextEditingController();
  final FocusNode _regCityFocusNode = FocusNode();
  final TextEditingController _carNameController = TextEditingController();
  final FocusNode _carNameFocusNode = FocusNode();
  final TextEditingController _carModelController = TextEditingController();
  final FocusNode _carModelFocusNode = FocusNode();
  final TextEditingController _yearController = TextEditingController();
  final FocusNode _yearFocusNode = FocusNode();

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
                child: Icon(Icons.list,color: subBackgroundColor,),
              ),
              rightAction: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => SettingsPage() ),
//                );
              },
              primaryText: 'Insurance Premium',
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Text("Get your car insurance premium",style: titleStyleTheam,),
                      SizedBox(height: 50,),
                      Text("Enter car registration city",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      new TextFormField(
                        controller: _regCityController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        focusNode: _regCityFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        // onEditingComplete: () => _emailEditingComplete(),
                        // onChanged: model.updateEmail,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: subBackgroundColor,
                          ),
                          labelText: "Mumbai,Chennai,....etc",
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
                      Text("Enter car name",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      new TextFormField(
                        controller: _carNameController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        focusNode: _carNameFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        // onEditingComplete: () => _emailEditingComplete(),
                        // onChanged: model.updateEmail,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.directions_car,
                            color: subBackgroundColor,
                          ),
                          labelText: "BMW,Audi,....etc",
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
                      Text("Enter car model",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      new TextFormField(
                        controller: _carModelController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        focusNode: _carModelFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        // onEditingComplete: () => _emailEditingComplete(),
                        // onChanged: model.updateEmail,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.local_car_wash,
                            color: subBackgroundColor,
                          ),
                          labelText: "A7,R8,i20......etc",
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
                      Text("Enter car purchased year",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      new TextFormField(
                        controller: _yearController,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        focusNode: _yearFocusNode,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        // onEditingComplete: () => _emailEditingComplete(),
                        // onChanged: model.updateEmail,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: subBackgroundColor,
                          ),
                          labelText: "2019,2012....etc",
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
                      SizedBox(height: 10,),
                      SizedBox(height: 50,),
                      ToDoButton(
                          assetName: 'images/googl-logo.png',
                          text: 'Submit',
                          textColor: Colors.white,
                          backgroundColor: backgroundColor,
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PremiumPlansPage() ),
                          );
                          }
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );

  }

}