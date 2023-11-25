import 'package:flutter/material.dart';

class ContactModel {
  const ContactModel({
    required this.label,
    required this.data,
    required this.icon,
  });

  final String label;
  final String data;
  final IconData icon;
}
