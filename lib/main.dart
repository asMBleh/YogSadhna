import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yogsadhna/yogatypeL.dart';
import 'Services.dart';
import 'yogdata.dart';
void main()=>runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.teal
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>new HomePageState() ;
}

class HomePageState extends State<HomePage> {
  List<Yoga> _yoga;
  List<YItem> _yItem;

  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading=true;
    Services.getyogdata().then((yoga){
     _yoga=yoga;
      _loading=false;
     setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...':'YogSadhna'),
      ),
      body: new Container(
        child: Center(
          child: new ListView.builder(
              itemCount: null ==_yoga ? 0: _yoga.length,
              itemBuilder: (context,index){
                Yoga yoga=_yoga[index];
              //  YItem yItem=_yoga[index][yItem];
                //Yoga yoga=_yoga;
                print("yoga_level_main"+yoga.toString());
                return GestureDetector(
                    onTap: (){
                      _yItem=yoga.yItem;
                      print("yItem  "+ _yItem.toString());
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> YogatypeL(y_list: yoga),));
                    },
                    child:Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                          child:Card(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                new ClipRRect(
                                  child: Image(
                                    image: NetworkImage(yoga.image),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.only(topLeft: new Radius.circular(16.0),topRight: new Radius.circular(16.0)),
                                ),
                                new Padding(padding: EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: ClipRRect(
                                      child: Text(yoga.lName,style: TextStyle(
                                          fontSize: 20,fontWeight: FontWeight.w800,color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ) //child: Text('Bigginer Page'),
                      ),

                    )
                );
              }
          )
        )
      )
    );
  }
}
