class User {
  final String id;
  final String username;
  final String token;

  User({this.id, this.username, this.token});

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], username: json['username'], token: json['token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return "$username, $token, $id";
  }
}
