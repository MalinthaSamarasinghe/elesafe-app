import 'package:google_maps_flutter/google_maps_flutter.dart';

class AlertDataModel {
  final String id;
  final String title;
  final String timestamp;
  final LatLng location;
  final String description;

  AlertDataModel({
    required this.id,
    required this.title,
    required this.timestamp,
    required this.location,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'timestamp': timestamp,
    'latitude': location.latitude,
    'longitude': location.longitude,
    'description': description,
  };

  factory AlertDataModel.fromJson(Map<String, dynamic> json) {
    return AlertDataModel(
      id: json['id'] as String,
      title: json['title'] as String,
      timestamp: json['timestamp'] as String,
      location: LatLng(
        json['latitude'] as double,
        json['longitude'] as double,
      ),
      description: json['description'] as String,
    );
  }
}
