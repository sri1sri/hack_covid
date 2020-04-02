
import 'package:flutter/material.dart';
import 'package:hackcovid/common_variables/app_colors.dart';
import 'package:hackcovid/common_variables/app_fonts.dart';


class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {
        this.primaryText,
        this.secondaryText,
        this.leftActionBar,
        this.rightActionBar,
        this.leftAction,
        this.rightAction,
        this.tabBarWidget,
        this.profile,
        this.color,
        this.brightness,
      });

  final Widget leftActionBar;
  final Widget rightActionBar;
  final String primaryText;
  final String secondaryText;
  final VoidCallback leftAction;
  final VoidCallback rightAction;
  final Widget tabBarWidget;
  final Widget profile;
  final Widget color;
  final Widget brightness;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 65,
                    left: 20,
                  ),
                  child: InkWell(
                    child: leftActionBar == null ? Container(
                      height: 0, width: 0,
                    ): leftActionBar,
                    onTap: leftAction,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:65.0),
                  child: Text(primaryText,style: subTitleStyleLight,),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 65,
                    right: 20,
                  ),
                  child: InkWell(
                    child: rightActionBar == null ? Container(
                      height: 0, width: 0,
                    ) : rightActionBar,
                    onTap: rightAction,
                  ),
                ),
              ],
            ),
          ),
          profile == null ? Container(height: 0,width: 0,) :profile,



        ],

      ),
    );
  }


}



