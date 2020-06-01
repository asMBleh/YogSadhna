import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'main.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ));
}

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}
class SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    loadData();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Container(
             height: 250,
             width: 250,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/images/im.jpg'),
                 fit: BoxFit.cover,
               ),
               borderRadius: BorderRadius.circular(200),
             ),
           ),
           Container(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Container(
                   child: Text('YogSadhna',
                     style: TextStyle(fontSize: 40,fontWeight: FontWeight.w300,color: Colors.white),
                     textAlign: TextAlign.start),
                 ),
               ],
             ),
           )
         ],
        ),
      ),
    );
  }
  Future<Timer> loadData() async{
    return new Timer(Duration(seconds: 5),onDoneLoading);
  }
  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
  }


}
