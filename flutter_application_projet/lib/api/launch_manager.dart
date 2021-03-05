import 'dart:core';

import 'package:flutter_application_projet/api/api_manager.dart';
import 'package:flutter_application_projet/model/launch.dart';

class LaunchManager {
  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  /// Charge et renvoie la liste des lancements passés
  Future<List<Launch>> loadPastLaunchs() async {
    // Calling API
    List<Launch> launches = [];
    try {
      var response = await ApiManager().getPastLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        for (var launch in results) {
          launches.add(Launch.fromJson(launch));
        }
        /* launches = List<Map<String, dynamic>>.from(response.data["data"])
            .map((json) => Launch.fromJson(json.toString()))
            .toList(); */
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return List.from(launches.reversed);
  }

  /// Charge et renvoie la liste des lancements passés
  Future<List<Launch>> loadCommingLaunchs() async {
    // Calling API
    List<Launch> launches = [];
    try {
      var response = await ApiManager().getCommingLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        for (var launch in results) {
          launches.add(Launch.fromJson(launch));
        }
        /* launches = List<Map<String, dynamic>>.from(response.data["data"])
            .map((json) => Launch.fromJson(json.toString()))
            .toList(); */
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return List.from(launches.reversed);
  }

  Future<Launch> loadNextLaunch() async {
    // Calling API
    Launch launch;
    try {
      var response = await ApiManager().getNextLaunch();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        launch = Launch.fromMap(results);

        /* launches = List<Map<String, dynamic>>.from(response.data["data"])
            .map((json) => Launch.fromJson(json.toString()))
            .toList(); */
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return launch;
  }

/*   Future<Future> getSpot(int idSpot) async {
    Spot spot;
    try {
      var response = await ApiManager().getSpot(idSpot);
      if (response != null && response.data != null) {
        spot = Spot.fromJson(response.data);
      }
    } catch (e, s) {
      print(s);
    }
    return spot;
  } */
}
