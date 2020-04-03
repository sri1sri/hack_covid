import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class PolicyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class F_PolicyDetails extends StatefulWidget {
  @override
  _F_PolicyDetailsState createState() => _F_PolicyDetailsState();
}

class _F_PolicyDetailsState extends State<F_PolicyDetails> {
  @override
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
                      Text('Policy Details',
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
              color: Color(0XFF233666),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Total Premium',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text('\$ 11,000',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 10),
                      child: Center(
                        child: Text('Pay now',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
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
}

Widget _buildContent(BuildContext context){
  return Scaffold(
    appBar: null,
    body: Container(
      child: Padding(
          padding: EdgeInsets.all(15),
        child: Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
                  child: Column(
                    children: <Widget>[
                      Text('Premium to be paid',
                        style: TextStyle(
                          color: Color(0XFF233666),
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('\$ 2,22,222',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade300,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blue,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: <Widget>[
                      textwidget('Owner name', 'Umesh Yadav'),
                      textwidget('Registration number', 'MH20CD0209'),
                      textwidget('Insured declarec value', '\$ 45,54,555'),
                      textwidget('Policy start date', 'Apr 22, 2020'),
                      textwidget('Policy end date', 'Apr 21, 2021'),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: RaisedButton(
                    onPressed: null,
                    child: Container(
                      decoration: BoxDecoration(
                        color:  Color(0XFF233666),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Center(
                        child: Text('View detail',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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

Widget textwidget(String _maintext, String _subtext){
  return Column(
    children: <Widget>[
      Text(_maintext,
        style: TextStyle(
          color: Color(0XFF233666),
          fontSize: 20,
          fontFamily: 'Montserrat',
        ),
      ),
      SizedBox(height: 10,),
      Text(_subtext,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey.shade300,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 10,),
    ],
  );
}
