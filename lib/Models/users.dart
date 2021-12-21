import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppUserModel {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? phoneNo;
  final String? password;
  final Timestamp? createdAt;
  final String? joinedAt;
  final bool? isAdmin;
  final String? email;
  final String? androidNotificationToken;

  // final Map? sectionsAppointed;
  AppUserModel(
      {this.id,
      this.name,
      this.phoneNo,
      this.password,
      this.createdAt,
      this.isAdmin,
      this.email,
      this.joinedAt,
      this.imageUrl,
      this.androidNotificationToken});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNo': phoneNo,
      'password': password,
      'createdAt': createdAt,
      'isAdmin': isAdmin,
      'email': email,
      'joinedAt': joinedAt,
      'imageUrl': imageUrl,
      'androidNotificationToken': androidNotificationToken,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
        id: map['id'],
        name: map['userName'],
        phoneNo: map['phoneNo'],
        password: map['password'],
        createdAt: map['createdAt'],
        imageUrl: map['imageUrl'],
        isAdmin: map['isAdmin'],
        email: map['email'],
        joinedAt: map['joinedAt'],
        androidNotificationToken: map['androidNotificationToken']);
  }

  factory AppUserModel.fromDocument(doc) {
    return AppUserModel(
      id: doc.data()["id"],
      password: doc.data()["password"],
      name: doc.data()["name"],
      createdAt: doc.data()["createdAt"],
      email: doc.data()["email"],
      imageUrl: doc.data()["imageUrl"],
      isAdmin: doc.data()["isAdmin"],
      phoneNo: doc.data()["phoneNo"],
      joinedAt: doc.data()["joinedAt"],
      androidNotificationToken: doc.data()["androidNotificationToken"],
    );
  }

  //String toJson() => json.encode(toMap());

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source));
}
