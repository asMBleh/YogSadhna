//
import 'package:flutter/services.dart';
import 'yogdata.dart';
class Services{

  static Future<List<Yoga>> getyogdata() async{
    try{
      final response= rootBundle.loadString('load_json/yogasan.json');
      if(response != null){
        String ss=await rootBundle.loadString('load_json/yogasan.json');
        final List<Yoga> yoga =yogaFromJson(ss);
        print('TName1: '+yoga.toString());
        return yoga;
      }
      else{
        return List<Yoga>();
      }
    }catch (e){
      return List<Yoga>();
    }
  }
  static Future<List<YItem>> getyogitemdata(yoga_yitem) async{
    try{
      final response= yoga_yitem;
      if(response != null){
        final List<YItem> yogasata =yogaFromJson(yoga_yitem).cast<YItem>();
        print('TName2: '+yogasata.toString());
        return yogasata;
      }
      else{
        return List<YItem>();
      }
    }catch (e){
      return List<YItem>();
    }
  }
}