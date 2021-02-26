import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'patch.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Links {
  final Patch patch;
  final String webcast;
  Links({
    this.patch,
    this.webcast,
  });

  Links copyWith({
    Patch patch,
    String webcast,
  }) {
    return Links(
      patch: patch ?? this.patch,
      webcast: webcast ?? this.webcast,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'patch': patch?.toMap(),
      'webcast': webcast,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Links(
      patch: Patch.fromMap(map['patch']),
      webcast: map['webcast'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() => 'Links(patch: $patch, webcast: $webcast)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Links && o.patch == patch && o.webcast == webcast;
  }

  @override
  int get hashCode => patch.hashCode ^ webcast.hashCode;
}
