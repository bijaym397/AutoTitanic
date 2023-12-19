import 'dart:convert';

class AddressModel {
  const AddressModel({
    this.street = '',
    this.city = '',
    this.state = '',
    this.country = '',
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
        street: map['street'] as String,
        city: map['city'] as String,
        state: map['state'] as String,
        country: map['country'] as String,
      );

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String get toAddress => [street, city, state, country].where((e) => e.trim().isNotEmpty).join(', ');

  final String street;
  final String city;
  final String state;
  final String country;

  AddressModel copyWith({
    String? street,
    String? city,
    String? state,
    String? country,
  }) =>
      AddressModel(
        street: street ?? this.street,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'street': street,
        'city': city,
        'state': state,
        'country': country,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'AddressModel(street: $street, city: $city, state: $state, country: $country)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.street == street && other.city == city && other.state == state && other.country == country;
  }

  @override
  int get hashCode => street.hashCode ^ city.hashCode ^ state.hashCode ^ country.hashCode;
}
