import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'core.dart';
import 'fairings.dart';
import 'links.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Launch {
  final Fairings fairings;
  final Links links;
  final String rocket;
  final bool success;
  final String details;
  final List<dynamic> crew;
  final List<dynamic> ships;
  final List<dynamic> capsules;
  final String launchpad;
  final bool autoUpdate;
  final String launchLibraryId;
  final List<dynamic> failures;
  final int flightNumber;
  final String name;
  final String dateUtc;
  final int dateUnix;
  final String dateLocal;
  final String datePrecision;
  final bool upcoming;
  final String id;
  bool isLike;
  Launch(
      {this.fairings,
      this.links,
      this.rocket,
      this.success,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.launchpad,
      this.autoUpdate,
      this.launchLibraryId,
      this.failures,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.id,
      this.isLike = false});

  Launch copyWith({
    Fairings fairings,
    Links links,
    String rocket,
    bool success,
    String details,
    List<dynamic> crew,
    List<dynamic> ships,
    List<dynamic> capsules,
    String launchpad,
    bool autoUpdate,
    String launchLibraryId,
    List<dynamic> failures,
    int flightNumber,
    String name,
    String dateUtc,
    int dateUnix,
    String dateLocal,
    String datePrecision,
    bool upcoming,
    List<Core> cores,
    String id,
  }) {
    return Launch(
      fairings: fairings ?? this.fairings,
      links: links ?? this.links,
      rocket: rocket ?? this.rocket,
      success: success ?? this.success,
      details: details ?? this.details,
      crew: crew ?? this.crew,
      ships: ships ?? this.ships,
      capsules: capsules ?? this.capsules,
      launchpad: launchpad ?? this.launchpad,
      autoUpdate: autoUpdate ?? this.autoUpdate,
      launchLibraryId: launchLibraryId ?? this.launchLibraryId,
      failures: failures ?? this.failures,
      flightNumber: flightNumber ?? this.flightNumber,
      name: name ?? this.name,
      dateUtc: dateUtc ?? this.dateUtc,
      dateUnix: dateUnix ?? this.dateUnix,
      dateLocal: dateLocal ?? this.dateLocal,
      datePrecision: datePrecision ?? this.datePrecision,
      upcoming: upcoming ?? this.upcoming,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fairings': fairings?.toMap(),
      'links': links?.toMap(),
      'rocket': rocket,
      'success': success,
      'details': details,
      'crew': crew,
      'ships': ships,
      'capsules': capsules,
      'launchpad': launchpad,
      'auto_update': autoUpdate,
      'launch_library_id': launchLibraryId,
      'failures': failures,
      'flight_number': flightNumber,
      'name': name,
      'date_utc': dateUtc,
      'date_unix': dateUnix,
      'date_local': dateLocal,
      'date_precision': datePrecision,
      'upcoming': upcoming,
      'id': id,
    };
  }

  factory Launch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var launch = Launch(
        fairings: Fairings.fromMap(map['fairings']),
        links: Links.fromMap(map['links']),
        rocket: map['rocket'],
        success: map['success'],
        details: map['details'],
        crew: List<dynamic>.from(map['crew']),
        ships: List<dynamic>.from(map['ships']),
        capsules: List<dynamic>.from(map['capsules']),
        launchpad: map['launchpad'],
        autoUpdate: map['auto_update'],
        launchLibraryId: map['launch_library_id'],
        failures: List<dynamic>.from(map['failures']),
        flightNumber: map['flight_number']?.toInt(),
        name: map['name'],
        dateUtc: map['date_utc'],
        dateUnix: map['date_unix']?.toInt(),
        dateLocal: map['date_local'],
        datePrecision: map['date_precision'],
        upcoming: map['upcoming'],
        id: map['id'],
        isLike: false);

    return launch;
  }

  String toJson() => json.encode(toMap());

  factory Launch.fromJson(Map<String, dynamic> source) {
    //print(source);

    return Launch.fromMap(source);
  }

  @override
  String toString() {
    return 'Launch(fairings: $fairings, links: $links, rocket: $rocket, success: $success, details: $details, crew: $crew, ships: $ships, capsules: $capsules, launchpad: $launchpad, auto_update: $autoUpdate, launch_library_id: $launchLibraryId, failures: $failures, flight_number: $flightNumber, name: $name, date_utc: $dateUtc, date_unix: $dateUnix, date_local: $dateLocal, date_precision: $datePrecision, upcoming: $upcoming, id: $id)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Launch &&
        o.fairings == fairings &&
        o.links == links &&
        o.rocket == rocket &&
        o.success == success &&
        o.details == details &&
        listEquals(o.crew, crew) &&
        listEquals(o.ships, ships) &&
        listEquals(o.capsules, capsules) &&
        o.launchpad == launchpad &&
        o.autoUpdate == autoUpdate &&
        o.launchLibraryId == launchLibraryId &&
        listEquals(o.failures, failures) &&
        o.flightNumber == flightNumber &&
        o.name == name &&
        o.dateUtc == dateUtc &&
        o.dateUnix == dateUnix &&
        o.dateLocal == dateLocal &&
        o.datePrecision == datePrecision &&
        o.upcoming == upcoming &&
        o.id == id;
  }

  @override
  int get hashCode {
    return fairings.hashCode ^
        links.hashCode ^
        rocket.hashCode ^
        success.hashCode ^
        details.hashCode ^
        crew.hashCode ^
        ships.hashCode ^
        capsules.hashCode ^
        launchpad.hashCode ^
        autoUpdate.hashCode ^
        launchLibraryId.hashCode ^
        failures.hashCode ^
        flightNumber.hashCode ^
        name.hashCode ^
        dateUtc.hashCode ^
        dateUnix.hashCode ^
        dateLocal.hashCode ^
        datePrecision.hashCode ^
        upcoming.hashCode ^
        id.hashCode;
  }
}
