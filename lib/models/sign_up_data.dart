import 'package:flutter/material.dart';

class SignUpData {
  String login;
  String password;
  String name;
  bool isArtist = false;
  FileImage? image;

  SignUpData({ 
    required this.login, 
    required this.password,
    required this.name,
    bool isArtist = false,
    this.image,
  });
}