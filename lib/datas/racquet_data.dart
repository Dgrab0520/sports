import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports/models/recquet_model.dart';

class RacquetRequest_Data{
  static const ROOT = "https://ahsjung.cafe24.com/second_racquet_insert.php";
  static const REQUEST_INSERT_ACTION = "REQUEST_INSERT";
  static const SELECT_REQUEST_ACTION = "SELECT_REQUEST";
  static const DELETE_REQUEST_ACTION = "DELETE_REQUEST";

  static Future<String> insertRequest(String request_id, String request_title, String request_phone, String request_count, String request_contents, String request_password) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = REQUEST_INSERT_ACTION;
      map['request_id'] = request_id;
      map['request_title'] = request_title;
      map['request_phone'] = request_phone;
      map['request_count'] = request_count;
      map['request_contents'] = request_contents;
      map['request_password'] = request_password;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Insert Request Response : ${response.body}");

      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }


  static Future<List<Racquet>> getRequest(String condition) async{
    try{
      var map = <String, dynamic>{};
      map['action'] = SELECT_REQUEST_ACTION;
      map['condition'] = condition;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Request Response : ${response.body}');
      if(response.statusCode == 200){
        List<Racquet> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }


  static Future<String> deleterRequest(String request_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = DELETE_REQUEST_ACTION;
      map['request_id'] = request_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Delete Request Response : ${response.body}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }



  static List<Racquet> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Racquet>((json) => Racquet.fromJson(json)).toList();
  }
}