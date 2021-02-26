import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'core.dart';
import 'fairings.dart';
import 'links.dart';

class Launch {
  final Fairings fairings;
  final Links links;
  final String rocket;
  final bool success;
  final String details;
  final List<dynamic> crew;
  final List<String> ships;
  final List<dynamic> capsules;
  final String launchpad;
  final bool auto_update;
  final String launch_library_id;
  final List<bool> failures;
  final int flight_number;
  final String name;
  final String date_utc;
  final int date_unix;
  final String date_local;
  final String date_precision;
  final bool upcoming;
  final List<Core> cores;
  final String id;
  Launch({
    this.fairings,
    this.links,
    this.rocket,
    this.success,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.launchpad,
    this.auto_update,
    this.launch_library_id,
    this.failures,
    this.flight_number,
    this.name,
    this.date_utc,
    this.date_unix,
    this.date_local,
    this.date_precision,
    this.upcoming,
    this.cores,
    this.id,
  });

  Launch copyWith({
    Fairings fairings,
    Links links,
    String rocket,
    bool success,
    String details,
    List<dynamic> crew,
    List<String> ships,
    List<dynamic> capsules,
    String launchpad,
    bool auto_update,
    String launch_library_id,
    List<dynamic> failures,
    int flight_number,
    String name,
    String date_utc,
    int date_unix,
    String date_local,
    String date_precision,
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
      auto_update: auto_update ?? this.auto_update,
      launch_library_id: launch_library_id ?? this.launch_library_id,
      failures: failures ?? this.failures,
      flight_number: flight_number ?? this.flight_number,
      name: name ?? this.name,
      date_utc: date_utc ?? this.date_utc,
      date_unix: date_unix ?? this.date_unix,
      date_local: date_local ?? this.date_local,
      date_precision: date_precision ?? this.date_precision,
      upcoming: upcoming ?? this.upcoming,
      cores: cores ?? this.cores,
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
      'auto_update': auto_update,
      'launch_library_id': launch_library_id,
      'failures': failures,
      'flight_number': flight_number,
      'name': name,
      'date_utc': date_utc,
      'date_unix': date_unix,
      'date_local': date_local,
      'date_precision': date_precision,
      'upcoming': upcoming,
      'cores': cores?.map((x) => x?.toMap())?.toList(),
      'id': id,
    };
  }

  factory Launch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Launch(
      fairings: Fairings.fromMap(map['fairings']),
      links: Links.fromMap(map['links']),
      rocket: map['rocket'],
      success: map['success'],
      details: map['details'],
      crew: List<dynamic>.from(map['crew']),
      ships: List<String>.from(map['ships']),
      capsules: List<dynamic>.from(map['capsules']),
      launchpad: map['launchpad'],
      auto_update: map['auto_update'],
      launch_library_id: map['launch_library_id'],
      failures: List<dynamic>.from(map['failures']),
      flight_number: map['flight_number']?.toInt(),
      name: map['name'],
      date_utc: map['date_utc'],
      date_unix: map['date_unix']?.toInt(),
      date_local: map['date_local'],
      date_precision: map['date_precision'],
      upcoming: map['upcoming'],
      cores: List<Core>.from(map['cores']?.map((x) => Core.fromMap(x))),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Launch.fromJson(String source) => Launch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Launch(fairings: $fairings, links: $links, rocket: $rocket, success: $success, details: $details, crew: $crew, ships: $ships, capsules: $capsules, launchpad: $launchpad, auto_update: $auto_update, launch_library_id: $launch_library_id, failures: $failures, flight_number: $flight_number, name: $name, date_utc: $date_utc, date_unix: $date_unix, date_local: $date_local, date_precision: $date_precision, upcoming: $upcoming, cores: $cores, id: $id)';
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
        o.auto_update == auto_update &&
        o.launch_library_id == launch_library_id &&
        listEquals(o.failures, failures) &&
        o.flight_number == flight_number &&
        o.name == name &&
        o.date_utc == date_utc &&
        o.date_unix == date_unix &&
        o.date_local == date_local &&
        o.date_precision == date_precision &&
        o.upcoming == upcoming &&
        listEquals(o.cores, cores) &&
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
        auto_update.hashCode ^
        launch_library_id.hashCode ^
        failures.hashCode ^
        flight_number.hashCode ^
        name.hashCode ^
        date_utc.hashCode ^
        date_unix.hashCode ^
        date_local.hashCode ^
        date_precision.hashCode ^
        upcoming.hashCode ^
        cores.hashCode ^
        id.hashCode;
  }
}
