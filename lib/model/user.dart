import 'dart:convert' as prefix0;

class User {
  int id;
  String name;
  String email;
  String aboutMe;

  User(int id, String name, String email, String aboutMe) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.aboutMe = aboutMe;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        aboutMe = json['aboutMe'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'aboutMe': aboutMe,
    };
  }
}
