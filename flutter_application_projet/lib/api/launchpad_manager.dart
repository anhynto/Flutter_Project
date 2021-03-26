import 'dart:core';

import 'package:flutter_application_projet/api/api_manager.dart';
import 'package:flutter_application_projet/model/launchpad.dart';

class LaunchpadManager {
  static final LaunchpadManager _instance = LaunchpadManager._internal();

  factory LaunchpadManager() => _instance;

  LaunchpadManager._internal();

  /// Charge et renvoie la liste des points de lancement
  Future<List<Launchpad>> loadLaunchpads() async {
    // Calling API
    List<Launchpad> launchpads = [];
    try {
      var response = await ApiManager().getLaunchpads();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        for (var lanchpad in results) {
          launchpads.add(Launchpad.fromMap(lanchpad));
        }
        /* launches = List<Map<String, dynamic>>.from(response.data["data"])
            .map((json) => Launch.fromJson(json.toString()))
            .toList(); */
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return List.from(launchpads);
  }
}
