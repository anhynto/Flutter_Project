import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_projet/model/launch.dart';

class LaunchDetailArguments {
  Launch launch;

  LaunchDetailArguments({this.launch});
}

class LaunchDetail extends StatefulWidget {
  static const route = "/launch";

  final Launch launch;

  LaunchDetail(this.launch);

  @override
  State<StatefulWidget> createState() => _LaunchDetailState(launch);
}

class _LaunchDetailState extends State<LaunchDetail> {
  Launch launch;
  //bool isFavorite;

  _LaunchDetailState(this.launch);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(launch.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: launch.links?.patch?.large != null
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      widget.launch.success != null
                          ? widget.launch.success
                              ? Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: Colors.green),
                                  child: Text(
                                    "Success",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: Colors.green),
                                  child: Text(
                                    "Failure",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                )
                          : Container(),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.launch.flight_number.toString() +
                          " - " +
                          widget.launch.name,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _LauchDesc(launch.details),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LauchDesc extends StatelessWidget {
  final String description;

  _LauchDesc(this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 6,
        ),
        Text(description ?? "No Details"),
      ],
    );
  }
}
