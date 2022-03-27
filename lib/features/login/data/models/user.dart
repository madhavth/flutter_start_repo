class User {
  final String? id;
  final String? username;
  final String? token;

  User({this.id, this.username, this.token});

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return "$username, $token, $id";
  }
}
