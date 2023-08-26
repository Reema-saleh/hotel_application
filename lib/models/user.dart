class HotelUser {
  String? userid;
  String? name;
  String? email;

  HotelUser({this.userid, this.name, this.email});

  HotelUser.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userid;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
