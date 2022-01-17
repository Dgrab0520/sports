import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sports/models/item_model.dart';


class Item_Data{
  static const ROOT = "https://akftmalffk.cafe24.com/second/second_item_select.php";
  static const ITEM_SELECT_ACTION = "ITEM_SELECT";

  static Future<List<Item>> getItem() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = ITEM_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Item Select Response: ${response.body}');
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

  static List<Item> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Item>((json) => Item.fromJson(json)).toList();
  }
}