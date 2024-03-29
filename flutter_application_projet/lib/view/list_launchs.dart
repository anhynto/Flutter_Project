import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_projet/api/launch_manager.dart';
import 'package:flutter_application_projet/model/launch.dart';
import 'package:intl/intl.dart';

import 'detail_launch.dart';

class LaunchListPage extends StatefulWidget {
  final bool past;

  LaunchListPage({this.past = false});

  @override
  State<StatefulWidget> createState() => _LaunchListPageState();
}

class _LaunchListPageState extends State<LaunchListPage> {
  final List<Launch> launchs = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launch>>(
      future: widget.past
          ? LaunchManager().loadPastLaunchs()
          : LaunchManager().loadCommingLaunchs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          launchs.clear();
          launchs.addAll(snapshot.data);
          return ListView.builder(
            itemBuilder: (context, position) {
              Launch launch = launchs[position];
              var date = DateFormat.yMMMMEEEEd()
                  .add_jms()
                  .format(DateTime.parse(launch.dateUtc).toUtc());
              return InkWell(
                onTap: () async {
                  await Navigator.of(context).pushNamed(LaunchDetail.route,
                      arguments: LaunchDetailArguments(launch: launch));
                },
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: launch.links?.patch?.small != null
                            ? Image.network(
                                launch.links.patch.small,
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return Text("not loaded image");
                                },
                              )
                            : Image.network(
                                "https://media.istockphoto.com/vectors/startup-icon-vector-id1074164928?k=6&m=1074164928&s=612x612&w=0&h=dD2gAKmO5MNG-eOh2WE34ZMoLSpF0j_YSYvTFKl-FfA="),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              launch.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Date : $date")
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(launch.isLike
                              ? Icons.favorite
                              : Icons.favorite_outline),
                          onPressed: () async {
                            await LaunchManager().toogleLike(launch);
                            setState(() {});
                          }),
                    ],
                  ),
                ),
              );
            },
            itemCount: launchs.length,
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
