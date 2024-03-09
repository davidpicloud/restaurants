import 'dart:convert';

import 'package:rest/restaurants_json.dart';

class Review {
  String user;
  String comment;

  Review({
    required this.user,
    required this.comment,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      user: json['user'],
      comment: json['comment'],
    );
  }
}

class Restaurant {
  final int id;
  final String name;
  final String type;
  final String location;
  final List<int> ratings;
  final List<Review> reviews;

  const Restaurant({
    required this.id,
    required this.name,
    required this.type,
    required this.location,
    required this.ratings,
    required this.reviews,
  });

  double get averageRating => ratings.isEmpty ? 0 : ratings.reduce((a, b) => a + b) / ratings.length;

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      location: json['location'],
      ratings: List<int>.from(json['ratings']),
      reviews: List<Review>.from(json['reviews'].map((reviewJson) => Review.fromJson(reviewJson))),
    );
  }
}

class RestaurantWithMyReview {
  final Restaurant restaurant;
  final int? myRating;
  final String? myComment;

  RestaurantWithMyReview({required this.restaurant, this.myRating, this.myComment});

  List<int> get ratings => myRating == null ? restaurant.ratings : [...restaurant.ratings, myRating!];
  double get averageRating => ratings.isEmpty ? 0 : ratings.reduce((a, b) => a + b) / ratings.length;
}

final List<Restaurant> restaurantBaseList = (jsonDecode(restaurantsJson)['restaurants'] as List)
    .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
    .toList();
