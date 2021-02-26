import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_projet/view/list_launchs.dart';

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
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
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
                icon: Icon(CupertinoIcons.rocket_fill),
                activeIcon: Icon(
                  CupertinoIcons.heart_fill,
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
        body: PageView(
          controller: _pageController,
          children: [LaunchListPage(), LaunchListPage(past: true)],
        ));
  }
}
