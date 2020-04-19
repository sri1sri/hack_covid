import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcovid/HomeScreens/QuickServices/PremiumPlans.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/button_widget/to_do_button.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:hackcovid/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
import 'package:hackcovid/firebase/database.dart';

import '../dashboard.dart';

class InsurancePremiumPage extends StatelessWidget {
  InsurancePremiumPage({@required this.database});
  Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_InsurancePremiumPage(database: database,),
    );
  }
}

class F_InsurancePremiumPage extends StatefulWidget {
  F_InsurancePremiumPage({@required this.database});
  Database database;

  @override
  _F_InsurancePremiumPageState createState() => _F_InsurancePremiumPageState();
}

class _F_InsurancePremiumPageState extends State<F_InsurancePremiumPage> {
  final _formKey = GlobalKey<FormState>();

  String _cityName;
  String _carName;
  String _carModel;
  String _purchaseYear;

  String _cityNameError = 'null';
  String _carNameError= 'null';
  String _carModelError= 'null';
  String _purchaseYearError= 'null';

  var dropDownValues = [];

  var cities = ['Nellore','Chennai','Pune'];
  var carNames = ['Seltose','Venue','XUV 500'];
  var carModels = ['1.6v','1.7v','1.8v'];
  var purchaseYears = ['2012','2013','2014','2015','2016','2017','2018','2019','2020',];

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
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/4.5),
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
              rightAction: () {},
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

                      DropDownFormField(
                        titleText: null,
                        hintText: 'select city',
                        value: _cityName,
                        onSaved: (value) {
                          setState(() {
                            _cityName = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _cityName = value;
                          });
                        },
                        dataSource: displayDropDownValues(cities),
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) =>
                        value != null ? null : 'Registration city can\'t be empty.',
                      ),

                      SizedBox(height: 20,),
                      Text("Enter car name",style: subTextStyleBlue),
                      SizedBox(height: 10,),

                      DropDownFormField(
                        titleText: null,
                        hintText: 'select car name',
                        value: _carName,
                        onSaved: (value) {
                          setState(() {
                            _carName = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _carName = value;
                          });
                        },
                        dataSource: displayDropDownValues(carNames),
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) =>
                        value != null ? null : 'Car name can\'t be empty.',
                      ),

                      SizedBox(height: 20,),
                      Text("Enter car model",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      DropDownFormField(
                        titleText: null,
                        hintText: 'select car model',
                        value: _carModel,
                        onSaved: (value) {
                          setState(() {
                            _carModel = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _carModel = value;
                          });
                        },
                        dataSource: displayDropDownValues(carModels),
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) =>
                        value != null ? null : 'Car model can\'t be empty.',
                      ),
                      SizedBox(height: 20,),
                      Text("Enter car purchased year",style: subTextStyleBlue),
                      SizedBox(height: 10,),
                      DropDownFormField(
                        titleText: null,
                        hintText: 'select purchase year',
                        value: _purchaseYear,
                        onSaved: (value) {
                          setState(() {
                            _purchaseYear = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _purchaseYear = value;
                          });
                        },
                        dataSource: displayDropDownValues(purchaseYears),
                        textField: 'display',
                        valueField: 'value',
                        validator: (value) =>
                        value != null ? null : 'purchase year can\'t be empty.',
                      ),

                      SizedBox(height: 50,),
                      ToDoButton(
                          assetName: 'images/googl-logo.png',
                          text: 'Submit',
                          textColor: Colors.white,
                          backgroundColor: backgroundColor,
                          onPressed: () {
                            _submit();
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

  displayDropDownValues(values){
    try{
      values.forEach((element) {
        var x = {
          "display": element,
          "value": element,
        };
        dropDownValues.add(x);
      }) ;
      return(dropDownValues.take([values][0].length).toList());
    }finally{
      dropDownValues.clear();
    }
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

        GoToPage(context, PremiumPlansPage(database: widget.database,));
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
    }
  }

}