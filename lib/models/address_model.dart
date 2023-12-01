import 'dart:convert';

class AddressModel {
  const AddressModel({
    this.street = '',
    this.city = '',
    this.country = '',
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
        street: map['street'] as String,
        city: map['city'] as String,
        country: map['country'] as String,
      );

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String street;
  final String city;
  final String country;

  String get toAddress => [street, city, country].where((e) => e.trim().isNotEmpty).join(', ');

  AddressModel copyWith({
    String? street,
    String? city,
    String? country,
  }) =>
      AddressModel(
        street: street ?? this.street,
        city: city ?? this.city,
        country: country ?? this.country,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'street': street,
        'city': city,
        'country': country,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'AddressModel(street: $street, city: $city, country: $country)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.street == street && other.city == city && other.country == country;
  }

  @override
  int get hashCode => street.hashCode ^ city.hashCode ^ country.hashCode;
}
