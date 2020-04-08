
import 'package:flutter/cupertino.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';



class OfflinePage extends CustomOfflinePage{
  OfflinePage({
    @required String text,
  }) : assert(text != null),
        super(
        text: text,
      );
}

class CustomOfflinePage extends StatelessWidget {

  CustomOfflinePage({this.text});

  final text;

  @override



  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Hack Covid",style: bigTitleStyle,),
            ),
            SizedBox(
              width: 400.0,
              height: 500.0,
              child: FlareActor("images/no internet.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:'no_netwrok'),
            ),
            //Splash(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('No Internet connection.\nPlease check connection!!!',style: titleStyle,),
            ),

          ],
        ) ,
      ),
    );
  }
}