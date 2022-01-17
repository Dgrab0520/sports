class Item{
  String user_id;
  String contents;

  Item({
    required this.user_id,
    required this.contents,
  });

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      user_id: json['user_id'] as String,
      contents: json['contents'] as String,
    );
  }

}