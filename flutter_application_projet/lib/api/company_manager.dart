import 'dart:core';

import 'package:flutter_application_projet/api/api_manager.dart';
import 'package:flutter_application_projet/model/company.dart';

class CompanyManager {
  static final CompanyManager _instance = CompanyManager._internal();

  factory CompanyManager() => _instance;

  CompanyManager._internal();

  /// Charge et renvoie la liste des points de lancement
  Future<Company> loadCompany() async {
    // Calling API
    Company spaceXDetails;
    try {
      var response = await ApiManager().getCompanyDetails();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        spaceXDetails = Company.fromMap(results);
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return spaceXDetails;
  }
}
