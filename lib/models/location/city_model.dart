import 'dart:convert';

class CityModel {
  const CityModel({
    this.id = '',
    this.country = '',
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) => CityModel(
        id: map['_id'] as String,
        country: map['country'] as String,
        name: map['name'] as String,
        createdAt: DateTime.parse(map['createdAt'] as String),
        updatedAt: DateTime.parse(map['updatedAt'] as String),
      );

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String country;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CityModel copyWith({
    String? id,
    String? country,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CityModel(
        id: id ?? this.id,
        country: country ?? this.country,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        '_id': id,
        'country': country,
        'name': name,
        'createdAt': createdAt?.millisecondsSinceEpoch,
        'updatedAt': updatedAt?.millisecondsSinceEpoch,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CityModel(_id: $id, country: $country, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(covariant CityModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.country == country && other.name == name && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ country.hashCode ^ name.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
