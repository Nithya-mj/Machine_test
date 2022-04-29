import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:machine_test/services/api_services.dart';

import '../models/home_model.dart';
class HomeProvider extends ChangeNotifier{
  HomeModel? homeModel;

  Future<void> getData() async{
    homeModel = await ApiServices().getData();
    notifyListeners();
  }

}
