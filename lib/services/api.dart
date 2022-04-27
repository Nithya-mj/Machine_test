import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:machine_test/models/home_model.dart';
class ApiData{
 static Future<String?> getData()async{
   var client = http.Client();
   HomeModel homeModel;
    try{
      var response =await client.get(Uri.parse('https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0'));
      debugPrint('response....$response');
      if(response.statusCode == 200){
        var jsonString = response.body;
        debugPrint('json string---------------$jsonString');
       var rejson = jsonDecode(jsonString);
        for (int i = 0; i < rejson.length; i++) {
          homeModel = HomeModel.fromJson(rejson[i]);
        }
      }
    }catch(err){
      debugPrint('>>>>>>>>>>>>>$err');
    }
  }
}
