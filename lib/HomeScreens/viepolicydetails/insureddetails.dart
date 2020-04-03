import 'package:flutter/material.dart';
import 'package:hackcovid/common_widgets/offline_widgets/offline_widget.dart';

class Insureddetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
          body: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(

    );
  }
}