import 'dart:async';

import 'package:aov_farmage/HomePage/HomeScreen.dart';
import 'package:aov_farmage/LoginPage/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aov FarmAge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatefulWidget {
  const Splash2({Key key}) : super(key: key);

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
Future<void> navigationPage()async{
  var _prefs = await SharedPreferences.getInstance();
  String  _userId = _prefs.getString('token')??'';
if(_userId!=null &&_userId!='')
  {
    print("User Id is:${_userId}");
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));

  }
else{
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>LoginScreen()));
}
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      /*child: SplashScreen(
        seconds: 7,
        image:  Image.asset('images/splash.png',),
        photoSize: 300.0,

      ),*/
      child: Image.asset('images/splash1.jpg',fit: BoxFit.cover,),
    );
  }
}


