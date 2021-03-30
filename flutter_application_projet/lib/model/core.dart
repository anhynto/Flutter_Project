import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Core {
  final String core;
  final int flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landingAttempt;
  final bool landingSuccess;
  final String landingType;
  final String landpad;
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  Core copyWith({
    String core,
    int flight,
    bool gridfins,
    bool legs,
    bool reused,
    bool landingAttempt,
    bool landingSuccess,
    String landingType,
    String landpad,
  }) {
    return Core(
      core: core ?? this.core,
      flight: flight ?? this.flight,
      gridfins: gridfins ?? this.gridfins,
      legs: legs ?? this.legs,
      reused: reused ?? this.reused,
      landingAttempt: landingAttempt ?? this.landingAttempt,
      landingSuccess: landingSuccess ?? this.landingSuccess,
      landingType: landingType ?? this.landingType,
      landpad: landpad ?? this.landpad,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'core': core,
      'flight': flight,
      'gridfins': gridfins,
      'legs': legs,
      'reused': reused,
      'landing_attempt': landingAttempt,
      'landing_success': landingSuccess,
      'landing_type': landingType,
      'landpad': landpad,
    };
  }

  factory Core.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Core(
      core: map['core'],
      flight: map['flight']?.toInt(),
      gridfins: map['gridfins'],
      legs: map['legs'],
      reused: map['reused'],
      landingAttempt: map['landing_attempt'],
      landingSuccess: map['landing_success'],
      landingType: map['landing_type'],
      landpad: map['landpad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Core.fromJson(String source) => Core.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Core(core: $core, flight: $flight, gridfins: $gridfins, legs: $legs, reused: $reused, landingAttempt: $landingAttempt, landingSuccess: $landingSuccess, landing_type: $landingType, landpad: $landpad)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Core &&
        o.core == core &&
        o.flight == flight &&
        o.gridfins == gridfins &&
        o.legs == legs &&
        o.reused == reused &&
        o.landingAttempt == landingAttempt &&
        o.landingSuccess == landingSuccess &&
        o.landingType == landingType &&
        o.landpad == landpad;
  }

  @override
  int get hashCode {
    return core.hashCode ^
        flight.hashCode ^
        gridfins.hashCode ^
        legs.hashCode ^
        reused.hashCode ^
        landingAttempt.hashCode ^
        landingSuccess.hashCode ^
        landingType.hashCode ^
        landpad.hashCode;
  }
}
