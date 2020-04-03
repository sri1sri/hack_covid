import 'package:flutter/material.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class Premiumbreakup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
          appBar: PreferredSize(
            preferredSize: Size(null, 60),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Color(0XFF233666),
                      ),
                      onTap: (){
                        Navigator.pop(context, true);
                      },
                    ),
                    Text('View policy details',
                      style: TextStyle(
                          color: Color(0XFF233666),
                          fontSize: 32,
                          fontFamily: 'Montserrat'
                      ),
                    ),
                    Container(

                    ),
                  ],
                ),
              ),
            ),
          ),
          body: _buildContent(context),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 10),
              child: Row(
                children: <Widget>[
                  Text('Total Premium',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                    ),
                  ),
                  Text('\$ 11000',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blue,
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
                    subtext('Electrical Accessories Premium', '22 Jan, 2020'),
                    subtext('Non-electrical Accessories Premium', '\$ 0'),
                    subtext('Road Side Assistance', '200/- rs'),
                    subtext('Zero Depreciation', '22 Jan, 2020'),
                    subtext('Engine protect plus', '5th of every month'),
                    subtext('Bi-fuel Kit Premium', '200/- rs'),
                    subtext('Geographic', '22 Jan, 2020'),
                    subtext('Geographic', '200/- rs'),
                    totalsubtext('Own damage premium', '200/- rs'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Liability'),
                  children: <Widget>[
                    subtext('Basic premium including TPPD', '\$ 0'),
                    subtext('Liability for Bi-fuel kit', '200/- rs'),
                    subtext('Co-passenger', '22 Jan, 2020'),
                    subtext('Personal accident', '5th of every month'),
                    subtext('Legal liability to paid driver', '200/- rs'),
                    subtext(
                        'Legal liability to paid employeee', '22 Jan, 2020'),
                    totalsubtext('Liability premium', '200/- rs'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Loading'),
                  children: <Widget>[
                    subtext('Break on loading', '\$ 0'),
                    subtext('Other loading', '200/- rs'),
                    totalsubtext('Loading premium', '200/- rs'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                ),
                ExpansionTile(
                  title: maintext('Discount'),
                  children: <Widget>[
                    subtext('Anti theft discount', '\$ 0'),
                    subtext('Voluntary discount', '200/- rs'),
                    subtext('Automobile membership discount', '22 Jan, 2020'),
                    subtext('Handicapped', '5th of every month'),
                    subtext('Deduct 20% for NCB', '200/- rs'),
                    totalsubtext('Total discount', '200/- rs'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
                ),
                totalsubtext('Total', '200/- rs'),
                totalsubtext('Tax', '200/- rs'),
              ],
            ),
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
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25,
            color: Color(0XFF233666),
          ),
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
            style: TextStyle(
              color: Colors.green,
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          Text(
            '$_right',
            style: TextStyle(
              color: Color(0XFF233666),
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget totalsubtext(String _left, String _right) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$_left :',
            style: TextStyle(
              color: Color(0XFF233666),
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
          Text(
            '$_right',
            style: TextStyle(
              color: Color(0XFF233666),
              fontFamily: 'Montserrat',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}