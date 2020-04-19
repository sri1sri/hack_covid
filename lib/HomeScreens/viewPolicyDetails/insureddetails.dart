import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class Insureddetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return F_Insureddetails();
  }
}
class F_Insureddetails extends StatefulWidget {
  @override
  _F_InsureddetailsState createState() => _F_InsureddetailsState();
}

class _F_InsureddetailsState extends State<F_Insureddetails> {
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
                    Text("₹12,000",style: subTitleStyle,),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
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
                title: maintext('Car Owner Details'),
                children: <Widget>[
                  subtext('Owner Name', USERNAME),
                  subtext('Email Address', 'nandy@gmail.com'),
                  subtext('Mobile Number', '9345463476'),
                  subtext('Date of Birth', '22 May, 1998'),
                  subtext('Gender', 'Female'),
                  subtext('PAN Number', 'BULPV4523'),
                  subtext('Landmark', 'DLF Office'),
                  subtext('Landline Number', '04223723311'),
                  subtext('GST Number', '734689784'),
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
                title: maintext("Nominee's Details"),
                children: <Widget>[
                  subtext('Nominee Name', 'Vasanthakumar'),
                  subtext('Nominee Relationship', 'Brother'),
                  subtext('Nominee DOB', '29 Oct, 1996'),
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
                title: maintext('Detailed Address'),
                children: <Widget>[
                  subtext('Address', '292/2,Thadagam Road'),
                  subtext('City', 'Coimbatore'),
                  subtext('State', 'TamilNadu'),
                  subtext('PinCode', '641002'),
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
                title: maintext('Car Details'),
                children: <Widget>[
                  subtext('Car Registration No.', 'TN 66 V 6571'),
                  subtext('Previous Insurer', 'Srivatsav'),
                  subtext('Previous Policy No.', '678GVGHJV09'),
                  subtext('Car Engine No.', '83748CZDFH5'),
                  subtext('Car Chassis No.', 'JS76VDD7FKJUJ777'),
                  subtext('Hypothecation/Loan', 'Lease'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Divider(
                  thickness: 1,
                  color: subBackgroundColor,
                ),
              ),
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