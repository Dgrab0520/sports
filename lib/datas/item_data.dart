import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sports/models/item_model.dart';

class Item_Data {
  static const ROOT = "https://ahsjung.cafe24.com/second_item.php";
  static const ITEM_LIST_ACTION = "ITEM_LIST";
  static const ITEM_SELECT_ACTION = "ITEM_SELECT";
  static const DELETE_ITEM_ACTION = "DELETE_ITEM";
  static const SEARCH_ITEM_ACTION = "SEARCH_ITEM";

  static Future<List<Item>> getList() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = ITEM_LIST_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Item List Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Item> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Item>> getItem(String item_id) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = ITEM_SELECT_ACTION;
      map['item_id'] = item_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Item Select Response: ${response.body}');
      if (response.statusCode == 200) {
        List<Item> list = parseResponse(response.body);
        return list;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Item>> searchItem(String item_name) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = SEARCH_ITEM_ACTION;
      map['item_name'] = item_name;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Item Search Response : ${response.body}");
      if(response.statusCode == 200){
        List<Item> list = parseResponse(response.body);
        return list;
      }else{
        return [];
      }
    }catch(e){
      return [];
    }
  }

  static Future<String> deleteItem(String item_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = DELETE_ITEM_ACTION;
      map['item_id'] = item_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Delete Request Response : ${response.body}');
      print('response.statuscode : ${response.statusCode}');
      if(200 == response.statusCode){
        return response.body;
      }else{
        return "error";
      }
    }catch(e){
      return "error";
    }
  }


  static List<Item> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => Item.fromJson(json)).toList();
  }
}
