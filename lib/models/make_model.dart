import 'dart:convert';

import 'package:flutter/foundation.dart';

class MakeModel {
  const MakeModel({
    this.id = '',
    this.label = '',
    this.logo = '',
    this.type,
    this.createdAt,
    this.updatedAt,
    this.models,
  });

  factory MakeModel.fromMap(Map<String, dynamic> map) => MakeModel(
        id: map['_id'] as String,
        label: map['label'] as String,
        logo: map['logo'] as String,
        type: (map['type'] as List<dynamic>).cast<String>(),
        createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt'] as String) : DateTime.now(),
        updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt'] as String) : DateTime.now(),
        models: map['models'] as List<dynamic>? ?? [],
      );

  factory MakeModel.fromJson(String source) => MakeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String label;
  final String logo;
  final List<String>? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? models;

  MakeModel copyWith({
    String? id,
    String? label,
    String? logo,
    List<String>? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<dynamic>? models,
  }) =>
      MakeModel(
        id: id ?? this.id,
        label: label ?? this.label,
        logo: logo ?? this.logo,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        models: models ?? this.models,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        '_id': id,
        'label': label,
        'logo': logo,
        'type': type,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch,
        'models': models,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'MakeModel(_id: $id, label: $label, logo: $logo, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, models: $models)';

  @override
  bool operator ==(covariant MakeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.logo == logo &&
        listEquals(other.type, type) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        listEquals(other.models, models);
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ logo.hashCode ^ type.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ models.hashCode;
}
