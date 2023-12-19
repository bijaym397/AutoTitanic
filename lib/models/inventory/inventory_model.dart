import 'dart:convert';

import 'package:auto_titanic/models/models.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/foundation.dart';

class InventoryModel {
  const InventoryModel({
    required this.make,
    required this.model,
    required this.variant,
    required this.price,
    required this.year,
    required this.capacity,
    required this.images,
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

  factory InventoryModel.fromMap(Map<String, dynamic> map) => InventoryModel(
        make: map['make'] as String,
        model: map['model'] as String,
        variant: map['variant'] as String,
        price: map['price'] as double,
        year: map['year'] as String,
        capacity: map['capacity'] as double,
        images: (map['images'] as List<dynamic>).cast<String>(),
        features: (map['features'] as List<dynamic>).cast<String>(),
        gearType: GearType.fromValue(map['gearType'] as int),
        fuelType: FuelType.fromValue(map['fuelType'] as int),
        bodyType: map['bodyType'] as String,
        power: map['power'] as String,
        distance: map['distance'] as double,
        seller: map['seller'] as String,
        address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
        rating: map['rating'] as double,
        reviews: map['reviews'] as int,
        labels: (map['labels'] as List<dynamic>).map((e) => LabelModel.fromMap(e as Map<String, dynamic>)).toList(),
      );

  factory InventoryModel.fromJson(String source) => InventoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String make;
  final String model;
  final String variant;
  final double price;
  final String year;
  final double capacity;
  final List<String> images;
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

  InventoryModel copyWith({
    String? make,
    String? model,
    String? variant,
    double? price,
    String? year,
    double? capacity,
    List<String>? images,
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
        make: make ?? this.make,
        model: model ?? this.model,
        variant: variant ?? this.variant,
        price: price ?? this.price,
        year: year ?? this.year,
        capacity: capacity ?? this.capacity,
        images: images ?? this.images,
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
        'make': make,
        'model': model,
        'variant': variant,
        'price': price,
        'year': year,
        'capacity': capacity,
        'images': images,
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
      'InventoryModel(make: $make, model: $model, variant: $variant, price: $price, year: $year, capacity: $capacity, images: $images, features: $features, gearType: $gearType, fuelType: $fuelType, bodyType: $bodyType, power: $power, distance: $distance, seller: $seller, address: $address, rating: $rating, reviews: $reviews, labels: $labels)';

  @override
  bool operator ==(covariant InventoryModel other) {
    if (identical(this, other)) return true;

    return other.make == make &&
        other.model == model &&
        other.variant == variant &&
        other.price == price &&
        other.year == year &&
        other.capacity == capacity &&
        listEquals(other.images, images) &&
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
      make.hashCode ^
      model.hashCode ^
      variant.hashCode ^
      price.hashCode ^
      year.hashCode ^
      capacity.hashCode ^
      images.hashCode ^
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
