import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../models/home_model.dart';
class HomeProvider extends ChangeNotifier{
  HomeModel? homeModel;
  List<HomeData>? homeData;
  List<Values>? category;
  List<Values>? banner;
  List<Values>? products;
   Future<String?> getData()async{
    var client = http.Client();
    try{
      var response =await client.get(Uri.parse('https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0'));
      //debugPrint('response....$response');
      if(response.statusCode == 200){
        var jsonString = response.body;
        debugPrint('json string---------------$jsonString');
        var rejson = jsonDecode(jsonString);
        debugPrint('json decode**********$rejson');
        //for (int i = 0; i < rejson.length; i++) {
          homeModel = HomeModel.fromJson(rejson);
          int? length = homeModel?.homeData?.length;
          if(homeModel?.homeData != null){
            for(int i = 0 ;i<length! ; i++){
              if(homeModel?.homeData?[i].type =='category'){
                category = homeModel?.homeData?[i].values;
                debugPrint('++++++++++++++++++++${category!.length}');
              }
              if(homeModel?.homeData?[i].type =='banners'){
                banner = homeModel?.homeData?[i].values;
                debugPrint('++++++++++++++++++++${banner!.length}');
              }
              if(homeModel?.homeData?[i].type =='products'){
                products = homeModel?.homeData?[i].values;
                debugPrint('++++++++++++++++++++${products!.length}');
              }
            }
          }
          notifyListeners();
        //}
      }
    }catch(err){
      debugPrint('>>>>>>>>>>>>>$err');
    }
  }
}
