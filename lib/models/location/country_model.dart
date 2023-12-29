import 'dart:convert';

import 'package:auto_titanic/models/models.dart';
import 'package:flutter/foundation.dart';

class CountryModel {
  const CountryModel({
    required this.id,
    required this.name,
    required this.flag,
    required this.countryCode,
    required this.currency,
    required this.cities,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) => CountryModel(
        id: map['_id'] as String,
        name: map['name'] as String,
        flag: map['flag'] as String,
        countryCode: map['countryCode'] as String,
        currency: map['currency'] as String,
        cities: (map['cities'] as List<dynamic>)
            .map((e) => CityModel.fromMap(
                  e as Map<String, dynamic>,
                ))
            .toList(),
        createdAt: DateTime.parse(map['createdAt'] as String),
        updatedAt: DateTime.parse(map['updatedAt'] as String),
      );

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String flag;
  final String countryCode;
  final String currency;
  final List<CityModel> cities;
  final DateTime createdAt;
  final DateTime updatedAt;

  CountryModel copyWith({
    String? id,
    String? name,
    String? flag,
    String? countryCode,
    String? currency,
    List<CityModel>? cities,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CountryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        flag: flag ?? this.flag,
        countryCode: countryCode ?? this.countryCode,
        currency: currency ?? this.currency,
        cities: cities ?? this.cities,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        '_id': id,
        'name': name,
        'flag': flag,
        'countryCode': countryCode,
        'currency': currency,
        'cities': cities,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CountryModel(_id: $id, name: $name, flag: $flag, countryCode: $countryCode, currency: $currency, cities: $cities, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.flag == flag &&
        other.countryCode == countryCode &&
        other.currency == currency &&
        listEquals(other.cities, cities) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      flag.hashCode ^
      countryCode.hashCode ^
      currency.hashCode ^
      cities.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
