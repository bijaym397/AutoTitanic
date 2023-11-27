import 'dart:convert';

class BrandModel {
  const BrandModel({
    required this.name,
    required this.icon,
  });

  factory BrandModel.fromMap(Map<String, dynamic> map) => BrandModel(
        name: map['name'] as String,
        icon: map['icon'] as String,
      );

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final String icon;

  BrandModel copyWith({
    String? name,
    String? icon,
  }) =>
      BrandModel(
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'icon': icon,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'BrandModel(name: $name, icon: $icon)';

  @override
  bool operator ==(covariant BrandModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.icon == icon;
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
