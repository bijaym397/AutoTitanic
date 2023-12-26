import 'dart:convert';
import 'dart:math';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/foundation.dart';

class InventoryModel {
  const InventoryModel({
    this.id = '',
    this.title = '',
    required this.type,
    required this.make,
    required this.model,
    required this.variant,
    required this.price,
    required this.year,
    required this.capacity,
    this.description = '',
    this.condition = '',
    this.currency = '',
    required this.media,
    required this.features,
    required this.gearType,
    required this.fuelType,
    required this.bodyType,
    required this.power,
    required this.distance,
    required this.seller,
    required this.address,
    required this.rating,
    required this.reviews,
    required this.labels,
  });

  factory InventoryModel.fromMap(Map<String, dynamic> map) {
    var model = InventoryModel(
      id: map['_id'] as String,
      type: Vehicle.fromValue(map['type'] as String),
      title: map['title'] as String,
      make: map['make'] as String? ?? '',
      model: map['model'] as String? ?? '',
      variant: map['variant'] as String? ?? '',
      price: map['price'] != null ? double.parse(map['price'].toString()) : 0,
      year: map['year'] as String? ?? '',
      capacity: map['capacity'] as double? ?? 0,
      description: map['description'] as String? ?? '',
      condition: map['condition'] as String? ?? '',
      currency: map['currency'] as String? ?? '',
      media: (map['media'] as List<dynamic>).cast<String>(),
      features: (map['features'] as List<dynamic>? ?? []).cast<String>(),
      gearType: GearType.fromValue(map['gearType'] as int? ?? 0),
      fuelType: FuelType.fromValue(map['fuelType'] as int? ?? 0),
      bodyType: map['bodyType'] as String? ?? '',
      power: map['power'] as String? ?? '',
      distance: map['distance'] as double? ?? 0,
      seller: map['seller'] as String? ?? '',
      // address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      address: AddressModel(
        state: map['state'],
        country: map['country'],
      ),
      rating: map['rating'] as double? ?? 0,
      reviews: map['reviews'].runtimeType == List ? (map['reviews'] as List).length : int.tryParse(map['reviews'].toString()) ?? 0,
      labels: (map['labels'] as List<dynamic>? ?? []).map((e) => LabelModel.fromMap(e as Map<String, dynamic>)).toList(),
    );
    var images = model.media;
    if (images.length < 2) {
      images = [
        ...images,
        ...List.generate(Random().nextInt(6) + 2, (_) => AssetConstants.car),
      ];
    }
    model = model.copyWith(media: images);
    return model;
  }

  factory InventoryModel.fromJson(String source) => InventoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String title;
  final Vehicle type;
  final String make;
  final String model;
  final String variant;
  final double price;
  final String year;
  final double capacity;
  final String description;
  final String condition;
  final String currency;
  final List<String> media;
  final List<String> features;
  final GearType gearType;
  final FuelType fuelType;
  final String bodyType;
  final String power;
  final double distance;
  final String seller;
  final AddressModel address;
  final double rating;
  final int reviews;
  final List<LabelModel> labels;

  String get name => '$make $model';

  String get details => [year, bodyType, distance.visibleDistance, '$capacity L', power, gearType.label, fuelType.label].join(' | ');

  String get customerReviews => '$rating (${reviews.formattedDistance} reviews)';

  String get amount => price.formattedPrice(currency);

  InventoryModel copyWith({
    String? id,
    Vehicle? type,
    String? make,
    String? model,
    String? variant,
    double? price,
    String? year,
    double? capacity,
    String? currency,
    String? description,
    String? condition,
    List<String>? media,
    List<String>? features,
    GearType? gearType,
    FuelType? fuelType,
    String? bodyType,
    String? power,
    double? distance,
    String? seller,
    AddressModel? address,
    double? rating,
    int? reviews,
    List<LabelModel>? labels,
  }) =>
      InventoryModel(
        id: id ?? this.id,
        type: type ?? this.type,
        make: make ?? this.make,
        model: model ?? this.model,
        variant: variant ?? this.variant,
        price: price ?? this.price,
        year: year ?? this.year,
        capacity: capacity ?? this.capacity,
        currency: currency ?? this.currency,
        description: description ?? this.description,
        condition: condition ?? this.description,
        media: media ?? this.media,
        features: features ?? this.features,
        gearType: gearType ?? this.gearType,
        fuelType: fuelType ?? this.fuelType,
        bodyType: bodyType ?? this.bodyType,
        power: power ?? this.power,
        distance: distance ?? this.distance,
        seller: seller ?? this.seller,
        address: address ?? this.address,
        rating: rating ?? this.rating,
        reviews: reviews ?? this.reviews,
        labels: labels ?? this.labels,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'type': type.value,
        'make': make,
        'model': model,
        'variant': variant,
        'price': price,
        'year': year,
        'capacity': capacity,
        'currency': currency,
        'condition': condition,
        'description': description,
        'media': media,
        'features': features,
        'gearType': gearType,
        'fuelType': fuelType,
        'bodyType': bodyType,
        'power': power,
        'distance': distance,
        'seller': seller,
        'address': address.toMap(),
        'rating': rating,
        'reviews': reviews,
        'labels': labels,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'InventoryModel(id: $id, type: $type, make: $make, model: $model, variant: $variant, price: $price, year: $year, capacity: $capacity, currency: $currency, condition: $condition, description: $description, media: $media, features: $features, gearType: $gearType, fuelType: $fuelType, bodyType: $bodyType, power: $power, distance: $distance, seller: $seller, address: $address, rating: $rating, reviews: $reviews, labels: $labels)';

  @override
  bool operator ==(covariant InventoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.make == make &&
        other.model == model &&
        other.variant == variant &&
        other.price == price &&
        other.year == year &&
        other.capacity == capacity &&
        other.currency == currency &&
        other.condition == condition &&
        other.description == description &&
        listEquals(other.media, media) &&
        listEquals(other.features, features) &&
        other.gearType == gearType &&
        other.fuelType == fuelType &&
        other.bodyType == bodyType &&
        other.power == power &&
        other.distance == distance &&
        other.seller == seller &&
        other.address == address &&
        other.rating == rating &&
        other.reviews == reviews &&
        listEquals(other.labels, labels);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      make.hashCode ^
      model.hashCode ^
      variant.hashCode ^
      price.hashCode ^
      year.hashCode ^
      capacity.hashCode ^
      currency.hashCode ^
      condition.hashCode ^
      description.hashCode ^
      media.hashCode ^
      features.hashCode ^
      gearType.hashCode ^
      fuelType.hashCode ^
      bodyType.hashCode ^
      power.hashCode ^
      distance.hashCode ^
      seller.hashCode ^
      address.hashCode ^
      rating.hashCode ^
      reviews.hashCode ^
      labels.hashCode;
}
