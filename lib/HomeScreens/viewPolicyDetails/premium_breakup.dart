import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:lottie/lottie.dart';

class  Premiumbreakup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return F_Premiumbreakup();
  }
}

class F_Premiumbreakup extends StatefulWidget {
  @override
  _F_PremiumbreakupState createState() => _F_PremiumbreakupState();
}

class _F_PremiumbreakupState extends State<F_Premiumbreakup> {
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _buildContent(context),
          bottomNavigationBar: Container(
            height:70,
            child: Padding(
              padding: const EdgeInsets.only(left:30.0,right:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Total Premium",style: subTextStyleBlue,),
                  Text("₹12,492",style: subTitleStyle,),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    var data = [
      ClicksPerYear('2016', 10000, Colors.green),
      ClicksPerYear('2017', 11000, Colors.green),
      ClicksPerYear('2018', 11000, Colors.green),
      ClicksPerYear('2019', 12000, Colors.green),
      ClicksPerYear('2020', 12500, Colors.green),
      ClicksPerYear('2021*',9000, Colors.green),

    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor
                  ),
                ),
                ExpansionTile(
                  title: maintext('Own damage'),
                  children: <Widget>[
                    subtext('Basic Premium', '5th of every month'),
                    subtext('Personal Belongings', '200/- rs'),
                    subtext('Key Product', '22 Jan, 2020'),
                    subtext('Consumable items', '5th of every month'),
                    subtext('Garage cash allowance', '200/- rs'),
                    subtext('Electrical Accessories \nPremium', '22 Jan, 2020'),
                    subtext('Non-electrical Accessories \nPremium', '\$ 0'),
                    subtext('Road Side Assistance', '200/- rs'),
                    subtext('Zero Depreciation', '22 Jan, 2020'),
                    subtext('Engine protect plus', '5th of every month'),
                    subtext('Bi-fuel Kit Premium', '200/- rs'),
                    subtext('Geographic', '22 Jan, 2020'),
                    subtext('Geographic', '200/- rs'),
                    SizedBox(height: 10,),
                    totalsubtext('Own damage premium', '200/- rs'),
                    SizedBox(height: 10,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Liability'),
                  children: <Widget>[
                    subtext('Basic premium including\n TPPD', '\$ 0'),
                    subtext('Liability for Bi-fuel kit', '200/- rs'),
                    subtext('Co-passenger', '22 Jan, 2020'),
                    subtext('Personal accident', '5th of every month'),
                    subtext('Legal liability to paid\n driver', '200/- rs'),
                    subtext( 'Legal liability to paid \nemployeee', '22 Jan, 2020'),
                    SizedBox(height: 10,),
                    totalsubtext('Liability premium', '200/- rs'),
                    SizedBox(height: 10,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Loading'),
                  children: <Widget>[
                    subtext('Break on loading', '\$ 0'),
                    subtext('Other loading', '200/- rs'),
                    SizedBox(height: 10,),
                    totalsubtext('Loading premium', '200/- rs'),
                    SizedBox(height: 10,),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Discount'),
                  children: <Widget>[
                    subtext('Anti theft discount', '\$ 0'),
                    subtext('Voluntary discount', '200/- rs'),
                    subtext('Automobile membership\n discount', '22 Jan, 2020'),
                    subtext('Handicapped', '5th of every month'),
                    subtext('Deduct 20% for NCB', '200/- rs'),
                    SizedBox(height: 10,),
                    totalsubtext('Total discount', '200/- rs'),
                    SizedBox(height: 10,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Premium for next year'),
                  children: <Widget>[
                    subtext('Total Premium upcoming\n year 2021*', '₹ 9000/-'),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),

                ExpansionTile(
                  title: maintext('Premium graph'),
                  children: <Widget>[
//                    Positioned(
//                        left: 15.0,
//                        right: 15.0,
//                        top: 5.0,
//                        bottom: 50.0,
//                        child: Lottie.network('https://assets6.lottiefiles.com/private_files/lf30_d3c6cL.json',height: 150,width: 150)),
                    chartWidget,
                  ],
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: subBackgroundColor,
                  ),
                ),
//                totalsubtext('Total', '200/- rs'),
//                totalsubtext('Tax', '200/- rs'),
              ],
            ),
        ),
      ),
    );
  }

  Widget maintext(String center) {
    return Row(
      children: <Widget>[
        Text(
          center,
          style: titleStyleTheam,
        ),
      ],
    );
  }

  Widget subtext(String _left, String _right) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$_left :',
            style: subTitleStyleDark
          ),
          Text(
            '$_right',
            style: descriptionStyleDarkBlur1
          ),
        ],
      ),
    );
  }

  Widget totalsubtext(String _left, String _right) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$_left :',
            style: subTextStyleBlue
          ),
          Text(
            '$_right',
            style: subTitleStyle
          ),
        ],
      ),
    );
  }
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}