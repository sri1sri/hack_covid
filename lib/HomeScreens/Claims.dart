import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
class ClaimsPage extends StatelessWidget {
  //ProfilePage({@required this.database});
  //Database database;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ClaimsPage(),
    );
  }
}

class F_ClaimsPage extends StatefulWidget {
  // F_ProfilePage({@required this.database});
  // Database database;

  @override
  _F_ClaimsPageState createState() => _F_ClaimsPageState();
}

class _F_ClaimsPageState extends State<F_ClaimsPage> {

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
          backgroundColor: Colors.black12,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Claims",style: topNavigationBarTitleStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('This Feature is \nnot yet Implemented....!',style: titleStyle,),
                    ),
                    SizedBox(
                      width: 600.0,
                      height: 700.0,
                      child: FlareActor("images/dash-2.flr", alignment:Alignment.topLeft, fit:BoxFit.contain, animation:'Untitled'),
                    ),
                    //Splash(),
                  ],
                ) ,
              ),
            ),
          ),
        )
    );

  }


}
