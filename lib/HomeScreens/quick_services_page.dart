import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:hackcovid/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:hackcovid/common_widgets/loading_page.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'locationData.dart';

class QuickService extends StatelessWidget {
  QuickService({@required this.serviceType,});
  String serviceType;
  @override
  Widget build(BuildContext context) {
    return F_QuickService(serviceType: serviceType);
  }
}

class F_QuickService extends StatefulWidget {
  F_QuickService({@required this.serviceType,});
  String serviceType;
  
  @override
  _F_QuickServiceState createState() => _F_QuickServiceState();
}

class _F_QuickServiceState extends State<F_QuickService> {

  List<dynamic> resultData;
  int resultDataLength;

  bool isLoading = true;

  Future<String> getData() async {
    print('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$LATITUDE,$LONGITUDE&radius=1500&type=${widget.serviceType}&key=AIzaSyBZmz5e3CgB8_k40TmlcJ_jIbjInioZq6k');

    var response = await http.get(
        Uri.encodeFull("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$LATITUDE,$LONGITUDE&radius=1500&type=${widget.serviceType}&key=AIzaSyBZmz5e3CgB8_k40TmlcJ_jIbjInioZq6k"),
        headers: {
          "Accept": "application/json"
        }
    );
    this.setState(() {
      Map<String, dynamic> map = json.decode(response.body);
      resultData = map["results"];
      resultDataLength = resultData.length;
      resultData != null ? isLoading = false : isLoading = true;


      print('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$LATITUDE,$LONGITUDE&radius=1500&type=${widget.serviceType}&key=AIzaSyAzGTfIcQ_PVhqG1g38yy9tokn90-hYLOI');
      print(resultDataLength);
  });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }


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

  _buildContent(BuildContext context) {
    return TransparentLoading(
      loading: isLoading,
      child: new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.width/5.5),
          child: CustomAppBar(
            leftActionBar: Container(
              child: Icon(Icons.arrow_back_ios,color: subBackgroundColor,),
            ),
            leftAction: () {
              Navigator.pop(context, true);
            },
            primaryText: 'Near by ${widget.serviceType == 'hospitals%20and%20clinic' ? 'hospitals': widget.serviceType}',
            secondaryText: null,
          ),
        ),
        body: LATITUDE != 0 ? resultDataLength != 0 ? new ListView.builder(
          itemCount: resultData == null ? 0 : resultData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                MapUtils.openMap(resultData[index]['geometry']['location']['lat'],resultData[index]['geometry']['location']['lng']);
              },
              child: new Card(
                elevation: 0,
                child: Container(
                  child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 10,),
                                    Text(resultData[index]['name'] != null ? resultData[index]['name'] : 'Name not mentioned',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: <Widget>[
                                        Text(resultData[index]['rating'] != null ? '${resultData[index]['rating'].toString()}' : 'No ratings',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0),),
                                        SizedBox(width: 10,),

                                        RatingBarIndicator(
                                          rating: resultData[index]['rating'] != null ? resultData[index]['rating']+ .0 : 0,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),

                                        SizedBox(width: 10,),

                                        Text(resultData[index]['user_ratings_total'] != null ? '(${resultData[index]['user_ratings_total'].toString()})' : '(0)',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.0),),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: 250,
                                      child: Text('${resultData[index]['vicinity'] != null ? resultData[index]['vicinity'] : 'No address mentioned'},${resultData[index]['plus_code'] != null ? resultData[index]['plus_code']['compound_code'] : ' '}',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,),
                                    ),
                                    SizedBox(height: 10,),
                                    resultData[index]['opening_hours']!= null ? resultData[index]['opening_hours']['open_now'] == true ?
                                    Text('Opened', style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),) :
                                    Text('Closed', style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),) :
                                    Text('Not mentioned', style: TextStyle(
                                        color: Colors.orange,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),)
                                  ]
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.map,color: subBackgroundColor,)
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
              )
            );
          },
        ) : nothingToDisplay('Nothing to display near your location.') : nothingToDisplay('Unable to fetch you location. Please enable your location and open the app again.'),
      ),
    );
  }

  Container nothingToDisplay(String message) {
    return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100,),
//                    Padding(
//                      padding: const EdgeInsets.all(15.0),
//                      child: Text("Claims",style: topNavigationBarTitleStyle,),
//                    ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width:300,
                      child: Text(message,
                        style: titleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,),
                    ),
                  ),
                  SizedBox(
                    width: 400.0,
                    height: 400.0,
                    child: FlareActor("images/dash-2.flr", alignment:Alignment.topLeft, fit:BoxFit.contain, animation:'Untitled'),
                  ),
                  //Splash(),
                ],
              ) ,
            );
  }
}

//Text(data[index]['geometry']['location']['lat'].toString()),