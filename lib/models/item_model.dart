class Item{
  String item_id;
  String item_name;
  String item_category;
  String item_price;
  String item_address;
  String item_contents;
  String register_date;
  String item_img1;
  String item_img2;
  String item_img3;
  String status;
  String index;

  Item({
    required this.item_id,
    required this.item_name,
    required this.item_category,
    required this.item_price,
    required this.item_address,
    required this.item_contents,
    required this.register_date,
    required this.item_img1,
    required this.item_img2,
    required this.item_img3,
    required this.status,
    required this.index,
  });

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      item_id: json['item_id'] as String,
      item_name: json['item_name'] as String,
      item_category: json['item_category'] as String,
      item_price: json['item_price'] as String,
      item_address: json['item_address'] as String,
      item_contents: json['item_contents'] as String,
      register_date: json['register_date'] as String,
      item_img1: json['item_img1'] == null ? "" : json['item_img1'] as String,
      item_img2: json['item_img2'] == null ? "" : json['item_img2'] as String,
      item_img3: json['item_img3'] == null ? "" : json['item_img3'] as String,
      status: json['status'] == null ? "" : json['status'] as String,
      index: json['index'] == null ? "" : json['status'] as String,

    );
  }

}