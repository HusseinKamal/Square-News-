import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Constant{
  static const String baseURL="http://newsapi.org/v2/everything?q=bitcoin";
  static const String newsURL="&from=2020-02-25&sortBy=publishedAt&apiKey=ae04811772b64bc3ba49d6359f022ab7";
  static String getImageURL(String url)
  {
    if(url!=null)
    {
      if(url.isEmpty)
      {
        return "";
      }
      else
      {
        return url;
      }
    }
    else
    {
      return "";
    }
  }
  static void gotToLink(BuildContext context,String url) async
  {
    if(url!=null)
    {
      if(url.isNotEmpty)
      {
        if (await canLaunch(url)) {
            await launch(url);
            } else {
          Toast.show("Empty URL !", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      }
      else
      {
        Toast.show("Empty URL !", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    }
    else
    {
      Toast.show("Empty URL !", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
}