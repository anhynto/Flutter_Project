import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Fairings {
  final bool reused;
  final bool recovery_attempt;
  final bool recovered;
  final List<String> ships;
  Fairings({
    this.reused,
    this.recovery_attempt,
    this.recovered,
    this.ships,
  });

  Fairings copyWith({
    bool reused,
    bool recovery_attempt,
    bool recovered,
    List<String> ships,
  }) {
    return Fairings(
      reused: reused ?? this.reused,
      recovery_attempt: recovery_attempt ?? this.recovery_attempt,
      recovered: recovered ?? this.recovered,
      ships: ships ?? this.ships,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reused': reused,
      'recovery_attempt': recovery_attempt,
      'recovered': recovered,
      'ships': ships,
    };
  }

  factory Fairings.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Fairings(
      reused: map['reused'],
      recovery_attempt: map['recovery_attempt'],
      recovered: map['recovered'],
      ships: List<String>.from(map['ships']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fairings.fromJson(String source) =>
      Fairings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fairings(reused: $reused, recovery_attempt: $recovery_attempt, recovered: $recovered, ships: $ships)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Fairings &&
        o.reused == reused &&
        o.recovery_attempt == recovery_attempt &&
        o.recovered == recovered &&
        listEquals(o.ships, ships);
  }

  @override
  int get hashCode {
    return reused.hashCode ^
        recovery_attempt.hashCode ^
        recovered.hashCode ^
        ships.hashCode;
  }
}
