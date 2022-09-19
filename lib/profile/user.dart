import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final String email;

  const User(this.name, this.email);
}
