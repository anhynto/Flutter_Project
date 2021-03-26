import 'package:flutter/material.dart';
import 'package:flutter_application_projet/view/detail_launch.dart';
import 'package:flutter_application_projet/view/home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'model/launch.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('spacex_logo');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Launchs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        var arguments = settings.arguments;
        switch (settings.name) {
          case LaunchDetail.route:
            Launch launch;
            if (arguments is LaunchDetailArguments) {
              launch = arguments.launch;
            }
            return MaterialPageRoute(builder: (_) => LaunchDetail(launch));

          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Center(child: Text("Route inconnue")),
                    ));
        }
      },
      home: HomePage(title: 'Launchs'),
    );
  }
}
