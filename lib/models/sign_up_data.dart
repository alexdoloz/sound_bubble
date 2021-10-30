import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpData {
  String login;
  String password;
  String name;
  bool isArtist = false;
  XFile? image;

  SignUpData({ 
    required this.login, 
    required this.password,
    required this.name,
    bool isArtist = false,
    this.image,
  });
}