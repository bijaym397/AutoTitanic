import 'dart:convert';

class VariantModel {
  VariantModel({
    this.id = '',
    required this.label,
    this.model = '',
    required this.createdAt,
    required this.updatedAt,
  });

  factory VariantModel.fromMap(Map<String, dynamic> map) => VariantModel(
        id: map['_id'] as String,
        label: map['label'] as String,
        model: map['model'] as String,
        createdAt: DateTime.parse(map['createdAt'] as String),
        updatedAt: DateTime.parse(map['updatedAt'] as String),
      );

  factory VariantModel.fromJson(String source) => VariantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String label;
  final String model;
  final DateTime createdAt;
  final DateTime updatedAt;

  VariantModel copyWith({
    String? id,
    String? label,
    String? model,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      VariantModel(
        id: id ?? this.id,
        label: label ?? this.label,
        model: model ?? this.model,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'label': label,
        'model': model,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'VariantModel(id: $id, label: $label, model: $model, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(covariant VariantModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.label == label && other.model == model && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode ^ model.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
