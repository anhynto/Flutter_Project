import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Core {
  final String core;
  final int flight;
  final bool gridfins;
  final bool legs;
  final bool reused;
  final bool landing_attempt;
  final bool landing_success;
  final String landing_type;
  final String landpad;
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landing_attempt,
    this.landing_success,
    this.landing_type,
    this.landpad,
  });

  Core copyWith({
    String core,
    int flight,
    bool gridfins,
    bool legs,
    bool reused,
    bool landing_attempt,
    bool landing_success,
    String landing_type,
    String landpad,
  }) {
    return Core(
      core: core ?? this.core,
      flight: flight ?? this.flight,
      gridfins: gridfins ?? this.gridfins,
      legs: legs ?? this.legs,
      reused: reused ?? this.reused,
      landing_attempt: landing_attempt ?? this.landing_attempt,
      landing_success: landing_success ?? this.landing_success,
      landing_type: landing_type ?? this.landing_type,
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
      'landing_attempt': landing_attempt,
      'landing_success': landing_success,
      'landing_type': landing_type,
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
      landing_attempt: map['landing_attempt'],
      landing_success: map['landing_success'],
      landing_type: map['landing_type'],
      landpad: map['landpad'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Core.fromJson(String source) => Core.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Core(core: $core, flight: $flight, gridfins: $gridfins, legs: $legs, reused: $reused, landing_attempt: $landing_attempt, landing_success: $landing_success, landing_type: $landing_type, landpad: $landpad)';
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
        o.landing_attempt == landing_attempt &&
        o.landing_success == landing_success &&
        o.landing_type == landing_type &&
        o.landpad == landpad;
  }

  @override
  int get hashCode {
    return core.hashCode ^
        flight.hashCode ^
        gridfins.hashCode ^
        legs.hashCode ^
        reused.hashCode ^
        landing_attempt.hashCode ^
        landing_success.hashCode ^
        landing_type.hashCode ^
        landpad.hashCode;
  }
}
