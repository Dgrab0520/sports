class Racquet{
  String request_id;
  String request_title;
  String request_phone;
  String request_count;
  String request_contents;
  String request_password;
  String request_date;
  String request_status;

  Racquet({
    required this.request_id,
    required this.request_title,
    required this.request_phone,
    required this.request_count,
    required this.request_contents,
    required this.request_password,
    required this.request_date,
    required this.request_status,
  });

  factory Racquet.fromJson(Map<String, dynamic> json){
    return Racquet(
      request_id: json['request_id'] == null ? "" : json['request_id'] as String,
      request_title: json['request_title'] == null ? "" : json['request_title'] as String,
      request_phone: json['request_phone'] == null ? "" : json['request_phone'] as String,
      request_count: json['request_count'] == null ? "" : json['request_count'] as String,
      request_contents: json['request_contents'] == null ? "" : json['request_contents'] as String,
      request_password: json['request_password'] == null ? "" : json['request_password'] as String,
      request_date: json['request_date'] == null ? "" : json['request_date'] as String,
      request_status: json['request_status'] == null ? "" : json['request_status'] as String,
    );
  }
}