import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_land/model/NewsDetails.dart';
import 'package:movies_land/util/ColorsUtil.dart';
import 'package:movies_land/util/Constant.dart';
class Details extends StatefulWidget{
  final NewsDetails newsDetails;
  // receive data from the FirstScreen as a parameter
  Details({Key key, @required this.newsDetails}) : super(key: key);
  @override
  _Details createState()=>_Details(newsDetails);

}
class _Details extends State<Details>
{
  NewsDetails newsDetails;
  _Details(NewsDetails newsDetails)
  {
    this.newsDetails=newsDetails;
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
    ),child:Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight:Radius.circular(15))
                    )
                ),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*.75,
                  child: FadeInImage.assetNetwork(
                    placeholder:'images/placeholder.png',
                    image:Constant.getImageURL(this.newsDetails.urlToImage),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width/2,
                    fit: BoxFit.fill,
                  ),
                )
            ),
    Expanded(
      child:SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                BoxConstraints(minHeight: 300),
                child: Column(children: [
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text(newsDetails.title,style: TextStyle(color: ColorsUtil.colorAccent,fontSize: 20.0,fontFamily:'Raleway'),textDirection: TextDirection.ltr,)),
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text('Author: '+newsDetails.author,style: TextStyle(color: ColorsUtil.colorAccent,fontSize: 14.0,fontFamily:'Raleway',fontWeight: FontWeight.w400),textDirection: TextDirection.ltr,)),
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text(newsDetails.description,style: TextStyle(color: const Color(ColorsUtil.colorPrimary),fontSize: 14.0,fontFamily:'Raleway',fontWeight: FontWeight.w400),textDirection: TextDirection.ltr,)),
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text(newsDetails.content,style: TextStyle(color: const Color(ColorsUtil.colorPrimary),fontSize: 14.0,fontFamily:'Raleway',fontWeight: FontWeight.w400),textDirection: TextDirection.ltr,)),
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:InkWell(onTap: () => Constant.gotToLink(context,newsDetails.url),child:Text(newsDetails.url,style: TextStyle(color: Colors.blueAccent,fontSize: 14.0,fontFamily:'Raleway',fontWeight: FontWeight.w400,decoration: TextDecoration.underline),textDirection: TextDirection.ltr,))),
                  new Container(width:MediaQuery.of(context).size.width,padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text('Published at: '+newsDetails.publishedAt,style: TextStyle(color: const Color(ColorsUtil.colorPrimary),fontSize: 14.0,fontFamily:'Raleway',fontWeight: FontWeight.w400),textDirection: TextDirection.ltr,)),

                ]),
              ),
            ))

          ],
        ),
      )
    ));
  }

}