import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_land/util/ColorsUtil.dart';
import 'Home.dart';
class Splash extends StatefulWidget{
  @override
  _Splash createState()=>_Splash();
}
class _Splash extends State<Splash>
{
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorsUtil.colorPrimary)
        ,body: new Container(width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height ,
          child: new Center(child: new Text("NEWS  SQUARE",style:new TextStyle(color:ColorsUtil.colorAccent,fontSize: 40,fontWeight: FontWeight.bold,fontFamily:'Raleway',backgroundColor:const Color(ColorsUtil.colorPrimary))),),
        )
    );
  }

}