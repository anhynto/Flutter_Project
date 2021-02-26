import 'dart:convert';

class Patch {
  final String small;
  final String large;
  Patch({
    this.small,
    this.large,
  });

  Patch copyWith({
    String small,
    String large,
  }) {
    return Patch(
      small: small ?? this.small,
      large: large ?? this.large,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'small': small,
      'large': large,
    };
  }

  factory Patch.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Patch(
      small: map['small'],
      large: map['large'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Patch.fromJson(String source) => Patch.fromMap(json.decode(source));

  @override
  String toString() => 'Patch(small: $small, large: $large)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Patch &&
      o.small == small &&
      o.large == large;
  }

  @override
  int get hashCode => small.hashCode ^ large.hashCode;
}