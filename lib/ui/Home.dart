import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_land/model/News.dart';
import 'package:movies_land/model/NewsDetails.dart';
import 'package:movies_land/ui/Details.dart';
import 'package:movies_land/util/ColorsUtil.dart';
import 'package:movies_land/util/Constant.dart';
import 'package:movies_land/util/api/EndPointApi.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget{
  @override
  _Home createState()=>_Home();
}
class _Home extends State<Home>
{
  News newsResult;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getNews();
    });

  }
  Future<String> getNews() async {
    try {
      final response = await Provider.of<EndPointApi>(context).getNews();
      if (response != null && response.statusCode == 200) {
        setState(() {
          newsResult = new News.fromJson(response.body);
          if (newsResult != null) {
            if (newsResult.articles.isEmpty) {
              Toast.show('Error Getting Data', context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            }
          }
        });
      }
      /*final http.Response response = await http.get("http://newsapi.org/v2/everything?q=bitcoin&from=2020-02-25&sortBy=publishedAt&apiKey=67e1fb4622374553bd3e80b97611f2f4");
      final Map<String, dynamic> responseData = json.decode(response.body);
      responseData['articles'].forEach((newsDetail) {
        setState(() {
          Toast.show(newsDetail.toString(), context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        });
      });*/
    }
    catch(e)
    {
      e.toString();
    }
    return "Success";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child:Text("News",style:TextStyle(color: ColorsUtil.colorAccent),)),
        automaticallyImplyLeading: false,
      ),
      body: new Container(
        child:loadNews(),width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,),
    );
  }
  Widget loadNews()
  {
    if(newsResult!=null)
    {
      if(newsResult.articles!=null) {
        if(newsResult.articles.isEmpty) {
          return getLoader();
        }
        else
        {
          return newsList();
        }
      }
      else
      {
        if(newsResult.articles.isEmpty) {
          return getLoader();
        }
        else
        {
          return newsList();
        }
      }
    }
    else
    {
      return getLoader();
    }
  }
  Widget newsList()
  {
    return ListView.builder(
        itemCount:newsResult==null?0:newsResult.articles.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap:(){} ,
            child:Card(
              elevation: 5.0,
              margin: EdgeInsets.only(left: 22.0,right: 22.0,top: 5.0,bottom: 5.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
              clipBehavior: Clip.antiAlias,
              child: new InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(newsDetails: newsResult.articles[index],),
                  ));
            },
            child:Column(
                  children: <Widget>[
                FadeInImage.assetNetwork(
                      placeholder:'images/placeholder.png',
                      image:Constant.getImageURL(newsResult.articles[index].urlToImage),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width/2,
                      fit: BoxFit.fill,
                    ),
                    new Container(padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text(newsResult.articles[index].title,style: TextStyle(color: ColorsUtil.colorAccent,fontSize: 16.0,fontFamily:'Raleway'),maxLines: 1,textDirection: TextDirection.ltr,)),
                    new Container(padding: EdgeInsets.only(left:10.0,right:10.0,bottom:5.0),child:Text(newsResult.articles[index].description,style: TextStyle(color: const Color(ColorsUtil.colorPrimary),fontSize: 10.0,fontFamily:'Raleway',fontWeight: FontWeight.w400),maxLines: 3,overflow: TextOverflow.ellipsis,textDirection: TextDirection.ltr,))
                  ],
                ),)
            ),
          );
        }
    );
  }

  Widget shimmerWidget() {
    return ListView.builder(
        itemCount:6,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            onTap:(){} ,
            child:Card(
              elevation: 5.0,
              margin: EdgeInsets.only(left: 22.0,right: 22.0,top: 10.0,bottom: 5.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  Container(child: Image(image: AssetImage('images/placeholder.png')),width: MediaQuery.of(context).size.width),
                  Container(width: 200,height: 50,child: Text("",style: TextStyle(color: ColorsUtil.colorAccent,fontSize: 22.0,fontFamily:'Raleway',backgroundColor: Colors.grey),textDirection: TextDirection.ltr,)),
                  Container(width: MediaQuery.of(context).size.width,height:50,child:Text("",style: TextStyle(color: const Color(ColorsUtil.colorPrimary),fontSize: 18.0,fontFamily:'Raleway',backgroundColor: Colors.grey,fontWeight: FontWeight.w400),maxLines: 3,overflow: TextOverflow.ellipsis,textDirection: TextDirection.ltr,)),
                ],
              ),
            ),
          );
        }
    );
  }
  Widget getLoader()
  {
    return Center(child:CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorsUtil.colorAccent),));
  }

}