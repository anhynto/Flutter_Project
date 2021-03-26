import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launchpad {
  final String name;
  final String fullName;
  final String type;
  final String locality;
  final String region;
  final double latitude;
  final double longitude;
  final String id;
  Launchpad(
      {this.name,
      this.fullName,
      this.type,
      this.locality,
      this.region,
      this.latitude,
      this.longitude,
      this.id});

  Launchpad copyWith(
      {String name,
      String fullName,
      String type,
      String locality,
      String region,
      double latitude,
      double longitude,
      String id}) {
    return Launchpad(
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      type: type ?? this.type,
      locality: locality ?? this.locality,
      region: region ?? this.region,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'full_name': fullName,
      'type': type,
      'locality': locality,
      'region': region,
      'latitude': latitude,
      'longitude': longitude,
      'id': id
    };
  }

  factory Launchpad.fromMap(Map<String, dynamic> map) {
    return Launchpad(
      name: map['name'],
      fullName: map['full_name'],
      type: map['type'],
      locality: map['locality'],
      region: map['region'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Launchpad.fromJson(String source) =>
      Launchpad.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Launchpad(name: $name, full_name: $fullName, type: $type, locality: $locality, region: $region, latitude: $latitude, longitude: $longitude, id : $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Launchpad &&
        other.name == name &&
        other.fullName == fullName &&
        other.type == type &&
        other.locality == locality &&
        other.region == region &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        fullName.hashCode ^
        type.hashCode ^
        locality.hashCode ^
        region.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        id.hashCode;
  }
}
