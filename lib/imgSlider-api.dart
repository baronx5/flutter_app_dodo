import 'dart:convert';

import 'imgSliderpp.dart';
import 'package:http/http.dart' as http;



  List<ImgSliderpp> imgListModel = [];

  fetchImg() async {

    final responseData = await http.get("http://swordtech.net/catdemo/select-cat.php");
    if (responseData.statusCode == 200){
      final data = jsonDecode(responseData.body);
      for(var i in data){
        imgListModel.add(ImgSliderpp.fromJson(i));
      }
    }
  }