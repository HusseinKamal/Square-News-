import 'package:flutter/material.dart';
import 'package:movies_land/ui/Details.dart';
import 'package:movies_land/ui/Splash.dart';
import 'package:movies_land/ui/Home.dart';
import 'package:movies_land/util/api/EndPointApi.dart';
import 'package:movies_land/util/sharedpreferencehelper/SharedPreference.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_land/util/ColorsUtil.dart';
var routes = <String, WidgetBuilder>{
  "/Details": (BuildContext context) => Details(),
  "/Home": (BuildContext context) => Home(),
};
void main() => runApp(
    Provider(
        builder: (_) => EndPointApi.create(),
        // Always call dispose on the ChopperClient to release resources
        dispose: (context, EndPointApi service) => service.client.dispose(),
        child:new MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale: Locale("ar", "SA"), // OR Locale('ar', 'AE') OR Other RTL locales,
            theme:
            ThemeData(primaryColor: const Color(ColorsUtil.colorPrimary), accentColor:ColorsUtil.colorAccent),
            debugShowCheckedModeBanner: false,
            home: App(),
            routes: routes)));

class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  var isRememberLogin=false;
  @override
  void initState() {
    super.initState();
   /* SharedPreference.getSharedString(SharedPreference.SHARED_PREFERENCE_ENCRYPTED_ACCESS_TOKEN).then((data){
      setState(() {
        if(data.isNotEmpty)
        {
          isRememberLogin=true;
        }
      });
    });*/
  }
  @override
  Widget build(BuildContext context) {
    return Splash();
  }

}
