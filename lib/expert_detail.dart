import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'yogatypeL.dart';
class Expert_Detailsrn extends StatelessWidget {
  final yItem;

  const Expert_Detailsrn({Key key, this.yItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: yItem.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage())),),
          title: Text('Yoga Detail'),
        ),
        body: Center(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(yItem.title,style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
                    textAlign: TextAlign.start,),
                  backgroundColor: Colors.yellowAccent,
                  expandedHeight: 300.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(
                      image: NetworkImage(yItem.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SliverFixedExtentList(
                    itemExtent: 800.00,
                    delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text('How to do:',style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black,),
                                        ),
                                        margin: EdgeInsets.only(bottom: 5,top:5),
                                        // color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(yItem.description,style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black,),
                                        ),
                                        margin: EdgeInsets.only(bottom: 20),
                                        // color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          child: Text('Warning:',style: TextStyle(
                                            fontSize: 16,fontWeight: FontWeight.w600,color: Colors.red,),
                                          ),
                                        margin: EdgeInsets.only(bottom: 5),
                                        // color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(yItem.warnings,style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.w400,color: Colors.brown,),
                                        ),
                                        margin: EdgeInsets.only(bottom: 20),
                                        // color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ),
                            ),
                        ]
                    )
                )
              ],
            )
        ),
      ),
    );
  }
}
