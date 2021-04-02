import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_projet/view/list_launchs.dart';
import 'package:flutter_application_projet/api/launch_manager.dart';
import 'package:flutter_application_projet/model/launch.dart';
import 'package:flutter_application_projet/view/map_view.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';

import 'company_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Launch theNextLaunch;
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FutureBuilder<Launch>(
      future: LaunchManager().loadNextLaunch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          theNextLaunch = snapshot.data;
          //on planifie la notif du prochain lancement
          LaunchManager().envoieNotification(theNextLaunch);
          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the HomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(widget.title),
              actions: [
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () async {
                    await Navigator.of(context).pushNamed(SpaceXDetail.route);
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    label: "UpComming",
                    icon: Icon(CupertinoIcons.rocket_fill),
                    activeIcon: Icon(
                      CupertinoIcons.rocket_fill,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    label: "Past",
                    icon: Icon(CupertinoIcons.timer),
                    activeIcon: Icon(
                      CupertinoIcons.timer_fill,
                      color: Colors.blue,
                    )),
                BottomNavigationBarItem(
                    label: "Launchpad",
                    icon: Icon(Icons.map_outlined),
                    activeIcon: Icon(
                      Icons.map_sharp,
                      color: Colors.blue,
                    ))
              ],
              currentIndex: _currentIndex,
              onTap: (newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
                _pageController.animateToPage(_currentIndex,
                    duration: kThemeAnimationDuration, curve: Curves.ease);
              },
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: theNextLaunch.links?.patch?.small != null
                            ? Image.network(
                                theNextLaunch.links.patch.small,
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return Text("not loaded image");
                                },
                              )
                            : Image.network(
                                "https://media.istockphoto.com/vectors/startup-icon-vector-id1074164928?k=6&m=1074164928&s=612x612&w=0&h=dD2gAKmO5MNG-eOh2WE34ZMoLSpF0j_YSYvTFKl-FfA="),
                      ),
                      Column(
                        children: [
                          Text(
                            theNextLaunch.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd().add_jms().format(
                                DateTime.parse(theNextLaunch.dateUtc).toUtc()),
                            style: TextStyle(fontSize: 14),
                          ),
                          CountdownTimer(
                            endTime: theNextLaunch.dateUnix * 1000,
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      children: [
                        LaunchListPage(),
                        LaunchListPage(past: true),
                        MapSample()
                      ],
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
