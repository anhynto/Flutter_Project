import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Fairings {
  final bool reused;
  final bool recoveryAttempt;
  final bool recovered;
  final List<String> ships;
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  Fairings copyWith({
    bool reused,
    bool recoveryAttempt,
    bool recovered,
    List<String> ships,
  }) {
    return Fairings(
      reused: reused ?? this.reused,
      recoveryAttempt: recoveryAttempt ?? this.recoveryAttempt,
      recovered: recovered ?? this.recovered,
      ships: ships ?? this.ships,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reused': reused,
      'recovery_attempt': recoveryAttempt,
      'recovered': recovered,
      'ships': ships,
    };
  }

  factory Fairings.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Fairings(
      reused: map['reused'],
      recoveryAttempt: map['recovery_attempt'],
      recovered: map['recovered'],
      ships: List<String>.from(map['ships']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fairings.fromJson(String source) =>
      Fairings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fairings(reused: $reused, recovery_attempt: $recoveryAttempt, recovered: $recovered, ships: $ships)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Fairings &&
        o.reused == reused &&
        o.recoveryAttempt == recoveryAttempt &&
        o.recovered == recovered &&
        listEquals(o.ships, ships);
  }

  @override
  int get hashCode {
    return reused.hashCode ^
        recoveryAttempt.hashCode ^
        recovered.hashCode ^
        ships.hashCode;
  }
}
