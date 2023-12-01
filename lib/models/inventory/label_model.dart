import 'dart:convert';

import 'package:flutter/widgets.dart';

class LabelModel {
  const LabelModel({
    required this.label,
    required this.color,
  });

  factory LabelModel.fromMap(Map<String, dynamic> map) => LabelModel(
        label: map['label'] as String,
        color: Color(map['color'] as int),
      );

  factory LabelModel.fromJson(String source) => LabelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String label;
  final Color color;

  LabelModel copyWith({
    String? label,
    Color? color,
  }) =>
      LabelModel(
        label: label ?? this.label,
        color: color ?? this.color,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'label': label,
        'color': color.value,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'LabelModel(label: $label, color: $color)';

  @override
  bool operator ==(covariant LabelModel other) {
    if (identical(this, other)) return true;

    return other.label == label && other.color == color;
  }

  @override
  int get hashCode => label.hashCode ^ color.hashCode;
}
