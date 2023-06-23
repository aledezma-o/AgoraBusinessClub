import 'dart:convert';

UserItem? userFromJson(String str) => UserItem.fromJson(json.decode(str));

String userToJson(UserItem? data) => json.encode(data!.toJson());

class UserItem {
  UserItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.photo,
    this.website,
  });
  // los que no tienen '?' no son requeridos y PUEDEN ser nulos
  String id;
  String firstName;
  String lastName;
  String password;
  String photo;
  String? website;

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        password: json["password"],
        photo: json["photo"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "photo": photo,
        "website": website,
      };
}
