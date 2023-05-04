


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart 'as http;

import '../api_model.dart';

class RemoteServices{
  Future<List<Welcome>?> getPost() async{
    var client= http.Client();
    var uri= Uri.parse('https://be2c-2405-201-f006-60f7-2308-2e78-a01d-2ce.ngrok-free.app/api/v1/zedzat/product-category/?category_type=product' );
    var reponse= await client.get(uri);
    print('Request failed with status: ${reponse.statusCode}.');
    print('Request failed with status: ${reponse.body}.');

    if(reponse.statusCode==200){
      var json= reponse.body;

      return welcomeFromJson(json);
    }
    else{
      Get.snackbar('${reponse.statusCode.toString()}','error');
    }
  }Future<List<Welcome>?> getPost1() async{
    var client= http.Client();
    var uri= Uri.parse('https://be2c-2405-201-f006-60f7-2308-2e78-a01d-2ce.ngrok-free.app/api/v1/zedzat/product-category/?category_type=service' );
    var reponse= await client.get(uri);
    print('Request failed with status: ${reponse.statusCode}.');
    print('Request failed with status: ${reponse.body}.');

    if(reponse.statusCode==200){
      var json= reponse.body;

      return welcomeFromJson(json);
    }
    else{
      Get.snackbar('${reponse.statusCode.toString()}','error');
    }
  }
}