import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_TermsAndServices(),
    );
  }
}

class F_TermsAndServices extends StatefulWidget {
  @override
  _F_TermsAndServices createState() => _F_TermsAndServices();
}

class _F_TermsAndServices extends State<F_TermsAndServices> {
  int _n = 0;
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);

  }

  Widget offlineWidget (BuildContext context){
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          leftActionBar: Container(
            child: Icon(Icons.arrow_back_ios,color: Colors.white,),
          ),
          leftAction: () {
            Navigator.pop(context, true);
          },
          rightActionBar: Container(
              child: Text("..........",style: TextStyle(color: backgroundColor),)
          ),
          rightAction: () {
            print('right action bar is pressed in appbar');
          },
          primaryText: 'Terms & Conditions',
          secondaryText: null,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 10,),
              _Notificationcard(),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),

    );
  }

  _Notificationcard()
  {
    return Container(

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Center(
            child: Text(
              'THIS PRIVACY POLICY APPLIES TO THE USE OF THE SERVICES (AS DEFINED BELOW) AND INFORMATION COLLECTED THROUGH THE SERVICES. PLEASE READ THIS PRIVACY POLICY CAREFULLY. IF YOU USE THE SERVICES IT MEANS YOU ARE ACCEPTING THIS PRIVACY POLICY AND AGREEING TO BE BOUND BY IT IN THE SAME MANNER AS IF YOU SIGNED YOUR NAME ON THIS PRIVACY POLICY. \n 1. General. This privacy policy (referred to in this document as this “Privacy Policy”) governs information that you provide or that we collect in connection with your use of the following (collectively, the “Services”): \n (a) www.truckast.com and all other Internet websites owned or operated by TRUCKAST, INC., or any of its affiliates (referred to in this document as “Company”) on which this Privacy Policy is posted (all such sites are collectively referred to in this document as the “Site”), as well as any content, products, services, features, functions or other resources offered on any of those sites ; and \n (b) any Company-branded application for your mobile, tablet or other device (“Truckast Application”), including any services made available through the Truckast Application. By accessing or using any of the Services, you are acknowledging that you have received notice of, and are accepting the practices described in, this Privacy Policy. References in this Privacy Policy to “you” or “your” or variations thereof shall mean individual users of the Services, and references to “we,” “our,” “us” or variations of any of these, shall mean the Company. For the avoidance of doubt, this Privacy Policy does not apply to information collected from customers who purchase or subscribe to our products or services and enter into a signed written agreement governing such products or services (“Agreements”), except to the extent otherwise expressly provided in such Agreements. In such cases, use of information collected in connection with the purchase of products and/or services shall be governed by the applicable Agreement.',
              style: descriptionStyle,
            ),
          ),
        ),
      ),

    );

  }

}