import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yogsadhna/main.dart';
import 'package:yogsadhna/yogdata.dart';
import 'Services.dart';
import 'expert_detail.dart';

class YogatypeL extends StatefulWidget{
  final y_list;

  const YogatypeL({Key key, this.y_list}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return YogatypeLState(y_list);
  }
}

class YogatypeLState extends State<YogatypeL>{
  List<YItem> _yItem;
  Yoga yoga;
  var yList;
  bool _loading;

  YogatypeLState(y_list){
        this.yList=y_list;
         yoga=y_list;
        _yItem=yoga.yItem;
  }
  @override
  void initState() {
    super.initState();
    _loading=true;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YogSadhna',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage())),),
              title: Text('${yList.lName}'),
            ),
            body:  new Container(
                child: Center(
                    child: new ListView.builder(
                        itemCount: null ==_yItem ? 0: _yItem.length,
                        itemBuilder: (context,index){
                          YItem yItem=_yItem[index];
                          print("yoga_level_list_item"+yItem.toString());
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Expert_Detailsrn(yItem: yItem),));
                            },
                            child:Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                  child: FittedBox(
                                    child: Material(
                                      color: Colors.white,
                                      elevation: 14.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                      shadowColor: Colors.black26,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 200,
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Container(
                                                      child: Text(yItem.title,style: TextStyle(
                                                          fontSize: 20,fontWeight: FontWeight.w300,color: Colors.black),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                      margin: EdgeInsets.only(bottom: 5),
                                                      // color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: ClipRRect(
                                                      child: Text(yItem.hindiTitle,style: TextStyle(
                                                          fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black87),
                                                        textAlign: TextAlign.left,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 120,
                                            width: 200,
                                            child: ClipRRect(
                                              borderRadius: new BorderRadius.circular(24.0),
                                              child: Image(
                                                fit: BoxFit.contain,
                                                alignment: Alignment.topRight,
                                                image: NetworkImage(yItem.imageUrl),
                                                //image: AssetImage('assets/images/im2.jpg'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ),
                            )
                          );
                        }
                    )
                )



               /*new FutureBuilder(
                      future: DefaultAssetBundle
                          .of(context)
                          .loadString(y_list.toString()),
                      builder: (context,snapshot){
                        var md= jsonDecode(snapshot.data.toString());
                        final jsonResponse=json.decode(snapshot.data.toString());
                       // var yogasan=fromJson(jsonResponse);

                        return new ListView.builder(
                           // itemCount: snapshot.data.length,
                            itemBuilder: (context,index){
                              var list_item = md[index]['y_item'];
                              print("yoga_level_list_item"+list_item.toString());
                              return GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Expert_Detailsrn(),));
                                },
                                child: Container(
                                    child: FittedBox(
                                      child: Material(
                                        color: Colors.white,
                                        elevation: 14.0,
                                        borderRadius: BorderRadius.circular(24.0),
                                        shadowColor: Colors.black26,
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 200,
                                              padding: EdgeInsets.all(10.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                        child: Text(list_item[index]['title'],style: TextStyle(
                                                            fontSize: 20,fontWeight: FontWeight.w300,color: Colors.black),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                        margin: EdgeInsets.only(bottom: 5),
                                                        // color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: ClipRRect(
                                                        child: Text(list_item[index]['hindiTitle'],style: TextStyle(
                                                            fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black87),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 120,
                                              width: 200,
                                              child: ClipRRect(
                                                borderRadius: new BorderRadius.circular(24.0),
                                                child: Image(
                                                  fit: BoxFit.contain,
                                                  alignment: Alignment.topRight,
                                                  image: NetworkImage(list_item[index]['imageUrl']),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              );
                            }
                        );
                        // ignore: missing_return
                      }
                  )*/
            )
        )



      /*ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ,
              )
            ],
          )*/
    );
  }
}