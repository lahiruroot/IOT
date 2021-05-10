import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Devide>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://nadun.smartqrlite.shop/json.php'));
  // print(response);
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Devide> parsePhotos(String responseBody) {
  // List fd = [];
  // Map<String, dynamic> x = jsonDecode(responseBody);
  // // print(x.keys);
  // x.forEach((key, value) {
  //   // print(key);
  //   // print(value);
  //   fd.add(value);
  // });
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  // print(parsed);
  return parsed.map<Devide>((json) => Devide.fromJson(json)).toList();
}

class Devide {
  final String temp;
  final String h;
  final String m;
  final String t;

  Devide({this.temp, this.m, this.h, this.t});

  factory Devide.fromJson(Map<String, dynamic> json) {
    return Devide(
      temp: json['value1'] as String,
      h: json['value2'] as String,
      m: json['value3'] as String,
      t: json['reading_time'] as String,
    );
  }
}

class MyDevice extends StatefulWidget {
  @override
  _MyDeviceState createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello world"),
      ),
      body: FutureBuilder<List<Devide>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          if (snapshot.hasData) {
            var fd =
                snapshot.data.where((element) => element.m == "1").toList();
            // print(fd);
            return ListView.builder(
                itemCount: fd.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Temp: ${fd[index].temp}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "Humidity: ${fd[index].h}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Motion: ${fd[index].m}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                "Time: ${fd[index].t}",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: Text("Hello"),
    );
  }
}
