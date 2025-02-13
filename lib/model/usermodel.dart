import 'package:flutter/material.dart';

class UserModel2 {
  String? name; // Name of the user
  Icon? icon; // Icon representing the user

  // Static list of UserModel2 objects
  static List<UserModel2> mylist = [
    UserModel2(name: 'John Doe', icon: Icon(Icons.person)),
    UserModel2(name: 'Jane Smith', icon: Icon(Icons.account_circle)),
    UserModel2(name: 'Mark Johnson', icon: Icon(Icons.face)),
    // Add more items as needed
  ];

  // Constructor for UserModel2 class
  UserModel2({this.name, this.icon});
}
