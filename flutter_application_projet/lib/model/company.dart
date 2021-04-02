import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Company {
  final String name;
  final String founder;
  final int founded;
  final int employees;
  final String ceo;
  final String cto;
  final String coo;
  final String ctoPropulsion;
  final int valuation;
  final String summary;
  Company({
    this.name,
    this.founder,
    this.founded,
    this.employees,
    this.ceo,
    this.cto,
    this.coo,
    this.ctoPropulsion,
    this.valuation,
    this.summary,
  });

  Company copyWith({
    String name,
    String founder,
    int founded,
    int employees,
    String ceo,
    String cto,
    String coo,
    String ctoPropulsion,
    int valuation,
    String summary,
  }) {
    return Company(
      name: name ?? this.name,
      founder: founder ?? this.founder,
      founded: founded ?? this.founded,
      employees: employees ?? this.employees,
      ceo: ceo ?? this.ceo,
      cto: cto ?? this.cto,
      coo: coo ?? this.coo,
      ctoPropulsion: ctoPropulsion ?? this.ctoPropulsion,
      valuation: valuation ?? this.valuation,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'founder': founder,
      'founded': founded,
      'employees': employees,
      'ceo': ceo,
      'cto': cto,
      'coo': coo,
      'cto_propulsion': ctoPropulsion,
      'valuation': valuation,
      'summary': summary,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'],
      founder: map['founder'],
      founded: map['founded'],
      employees: map['employees'],
      ceo: map['ceo'],
      cto: map['cto'],
      coo: map['coo'],
      ctoPropulsion: map['cto_propulsion'],
      valuation: map['valuation'],
      summary: map['summary'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Company(name: $name, founder: $founder, founded: $founded, employees: $employees, ceo: $ceo, cto: $cto, coo: $coo, cto_propulsion: $ctoPropulsion, valuation: $valuation, summury: $summary)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Company &&
        other.name == name &&
        other.founder == founder &&
        other.founded == founded &&
        other.employees == employees &&
        other.ceo == ceo &&
        other.cto == cto &&
        other.coo == coo &&
        other.ctoPropulsion == ctoPropulsion &&
        other.valuation == valuation &&
        other.summary == summary;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        founder.hashCode ^
        founded.hashCode ^
        employees.hashCode ^
        ceo.hashCode ^
        cto.hashCode ^
        coo.hashCode ^
        ctoPropulsion.hashCode ^
        valuation.hashCode ^
        summary.hashCode;
  }
}
