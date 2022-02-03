import 'package:http/http.dart' as http;

class ItemRegister_Data {
  static const ROOT = "https://ahsjung.cafe24.com/second_item_insert.php";
  static const UDPATE_ITEM_ACTION = "UPDATE_ITEM";

  static Future<String> updateItem(
      String item_id,
      String item_name,
      String item_category,
      String item_price,
      String item_address,
      String item_contents,
      String password,
      String img1,
      String img2,
      String img3) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = UDPATE_ITEM_ACTION;
      map['item_id'] = item_id;
      map['item_name'] = item_name;
      map['item_category'] = item_category;
      map['item_price'] = item_price;
      map['item_address'] = item_address;
      map['item_contents'] = item_contents;
      map['password'] = password;
      map['img1'] = img1;
      map['img2'] = img2;
      map['img3'] = img3;

      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Update Item Response : ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
