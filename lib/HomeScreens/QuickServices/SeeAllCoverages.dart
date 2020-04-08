import 'package:flutter/material.dart';
import 'package:hackcovid/HomeScreens/SettingsPage.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class SeeAllCoveragesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SeeAllCoveragesPage(),
    );
  }
}

class F_SeeAllCoveragesPage extends StatefulWidget {

  @override
  _F_SeeAllCoveragesPageState createState() => _F_SeeAllCoveragesPageState();
}

class _F_SeeAllCoveragesPageState extends State<F_SeeAllCoveragesPage> {

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
              primaryText: 'Coverages',
              secondaryText: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                  _policybody()
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }


  Widget _policybody(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Zero Depreciation',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Post an accident while replacing the parts of the car '
                      '(fibre, metal and rubber), you don’t have to pay for the devaluating wear and tear. '
                      'They will be covered 100% by your insurance company.\n\n'
                      'Key Inclusions:\n'
                      'Fibre, Metal and Rubber Parts.\n\n'
                      'Key Exclusions:\n'
                      'Battery and Tyres.',
                    style: highlightDescription

                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Consumable items',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Due to accidental damages, the expenses on replacing consumable '
                      'items are insured with this add-on cover.\n\n'
                      'Key Inclusions:\n'
                      'Nut and bolt, washers, grease, lubricants clip, ac gas, bearings,'
                      ' distilled water, engine oil, oil filter, fuel filter, break oil and the like.',
                    style: highlightDescription
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Co Passengers',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Compensation is provided to your co-passengers if they suffer '
                      'from injuries arising out of a car accident.',
                    style: highlightDescription
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Car Damages',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('In case of an accident, we pay the cost of damages to your car.\n\n'
                      'Key Inclusions:\n'
                      'Natural calamities (Fire, lightening, flood etc.), Man-made'
                      ' disasters(Burglary, theft, riot, strikes etc.)\n\n'
                      'Key Exclusions:\n'
                      'Depreciation of car parts, tyres, car driven under intoxication.',
                    style: highlightDescription
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Third Party Liabilities',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('If you accidentally ram your car into someone or '
                      'something, we will pay for the legal liabilities – injury or '
                      'death of a person, and damage caused to the surrounding '
                      'property.\n\n'
                      'Key Exclusions:\n'
                      '1.Accidents outside geographical area.\n\n'
                      '2. Car drive by someone who is not the owner or driver.\n\n'
                      '3. Loss or damage due to war or invasion.',
                    style: highlightDescription
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Personal Accident',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('We pay up to ₹ 15 lakhs in case of death or'
                      ' permanent disability caused to the owner-driver due '
                      'to an accident.\n\n'
                      'Key Inclusions:\n'
                      'Registered owner of the car, valid license held by the driver as per motor vehicle rules.\n\n'
                      'Key Exclusions:\n'
                      'Accident caused outside geographical area.',
                    style: highlightDescription
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Card(
              color: Colors.white,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Road Side Assistance ',
                    style: TextStyle(
                        color: Color(0xFF253949),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0)
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Card(
              elevation: 1,
              child: Container(
                color: Colors.grey[100],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Get towing assistance in case of -car '
                      'break down & accidents and other assistance like'
                      ' battery jump start, fuel supply, flat tyre,'
                      ' break down support over the plane etc.\n\n'
                      'Key Exclusions:\n'
                      'Major repairs, services during natural'
                      ' or man-made calamities, services'
                      ' done without prior approval from us.',
                    style: highlightDescription
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}