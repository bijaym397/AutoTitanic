import 'dart:convert';

class DropDownModel {
  const DropDownModel({
    this.label = '',
    this.id = '',
  });

  factory DropDownModel.fromMap(Map<String, dynamic> map) => DropDownModel(
        label: map['label'] as String,
        id: map['id'] as String,
      );

  factory DropDownModel.fromJson(String source) => DropDownModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String label;
  final String id;

  DropDownModel copyWith({
    String? label,
    String? id,
  }) =>
      DropDownModel(
        label: label ?? this.label,
        id: id ?? this.id,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'label': label,
        'id': id,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'DropDownModel(label: $label, id: $id)';

  @override
  bool operator ==(covariant DropDownModel other) {
    if (identical(this, other)) return true;

    return other.label == label && other.id == id;
  }

  @override
  int get hashCode => label.hashCode ^ id.hashCode;
}
