import 'dart:core';

import 'package:flutter_application_projet/api/api_manager.dart';
import 'package:flutter_application_projet/model/launch.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import 'package:timezone/timezone.dart' as tz;

import '../main.dart';

class LaunchManager {
  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  /// Charge et renvoie la liste des lancements passés
  Future<List<Launch>> loadPastLaunchs() async {
    // Calling API
    Launch launchFavorite;
    List<Launch> launches = [];
    try {
      var response = await ApiManager().getPastLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        for (var launch in results) {
          //pour chaque Launch on va aller voir en base sa valeur de favoris
          launchFavorite = Launch.fromJson(launch);
          launchFavorite.isLike = await checkInBDDIfIsLiked(launchFavorite.id);
          launches.add(launchFavorite);
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
    Launch launchFavorite;
    List<Launch> launches = [];
    try {
      var response = await ApiManager().getCommingLaunches();
      if (response != null && response.data != null) {
        // Mapping data
        var results = response.data;
        for (var launch in results) {
          //pour chaque Launch on va aller voir en base sa valeur de favoris
          launchFavorite = Launch.fromJson(launch);
          launchFavorite.isLike = await checkInBDDIfIsLiked(launchFavorite.id);
          launches.add(launchFavorite);
        }
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
      }
    } catch (e) {
      print(e);
    }
    //on renvoie la liste inversé afin d'avoir les plus récents en haut de la liste
    return launch;
  }

  Future<void> toogleLike(Launch launch) async {
    //focntion qui permet de changer le statut de favori en base
    launch.isLike = !launch.isLike;
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    String dbPath = '$dataDirectoryPath/spacex_launch.db';
    Database db = await databaseFactoryIo.openDatabase(dbPath);
    var store = StoreRef.main();
    String key = launch.id;
    //on enregistre ici l'id du Lauch et son statut de like uniquement
    await store.record(key).put(db, {'isLike': launch.isLike});
  }

  Future<bool> checkInBDDIfIsLiked(String idLaunch) async {
    //renvoie la valeur du flag favorie de l'id du Launch passé en paramètre
    bool status = false;
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    String dbPath = '$dataDirectoryPath/spacex_launch.db';
    Database db = await databaseFactoryIo.openDatabase(dbPath);
    var store = StoreRef.main();
    String key = idLaunch;
    //on va lire en base
    await store.record(key).get(db).then(
      (resultBD) {
        //on regarde un resultat existe ?
        if (resultBD == null) {
          //si il n'existe pas c'estq qu'il n'est pas favori et donc on renvoie faux
          status = false;
        } else {
          //sinon on renvoie la valeur stocker de isLike associé à l'id passé en parametres
          status = resultBD['isLike'];
        }
      },
    );
    return status;
  }

  void envoieNotification(Launch launch) async {
    //var scheduleNotificationDateTime =
    //    tz.TZDateTime.now(tz.UTC).add(const Duration(seconds: 1));
    //paramétrage de la date pour la planification de la notif
    var scheduleNotificationDateTime =
        tz.TZDateTime.parse(tz.UTC, launch.date_utc);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for launch notification',
      icon: 'spacex_logo',
      largeIcon: DrawableResourceAndroidBitmap('spacex_logo'),
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      launch.flight_number,
      '${launch.name} is launching!',
      '${launch.name} is launching right now. Don\'t miss it!',
      scheduleNotificationDateTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
