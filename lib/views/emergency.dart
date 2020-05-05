import 'package:flutter/material.dart';
import 'package:hello/presentation/custom_icons_icons.dart';
import 'package:hello/strings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/tweets.dart';

class Emergency extends StatefulWidget {
  final String collection;
  Emergency(this.collection);

  @override
  State<StatefulWidget> createState() => EmergencyState(collection);
}

class EmergencyState extends State<Emergency> {
  Future<Tweets> futureTweets;
  String collection;
  EmergencyState(this.collection);

  @override
  void initState() {
    super.initState();
    futureTweets = _fetchTweets(collection);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: futureTweets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, position) {
                return getTweetView(snapshot.data.documents[position]);
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<Tweets> _fetchTweets(String collection) async {
  final response = await http.get(Strings.fetchDocumentsBaseUrl + collection);
  if (response.statusCode == 200) {
    return Tweets.fromJson(json.decode(response.body));
  } else {
    throw Exception('Can\'t Connect');
  }
}

Widget getTweetView(Documents tweetDoc) {
  return Dismissible(
    key: Key(tweetDoc.tweetId),
    direction: DismissDirection.horizontal,
    background: Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            CustomIcons.delete,
            color: Colors.red,
            size: 48.0,
          ),
        ],
      ),
    ),
    secondaryBackground: Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            CustomIcons.delete,
            color: Colors.red,
            size: 48.0,
          ),
        ],
      ),
    ),
    child: Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      elevation: 8.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 25.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(tweetDoc.profileImageUrl),
                    radius: 24.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '@' + tweetDoc.username,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  DateTime.now()
                          .difference(DateTime.fromMicrosecondsSinceEpoch(
                              int.parse(tweetDoc.timestamp.date.numberLong) *
                                  1000))
                          .inDays
                          .toString() +
                      'd',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
            child: Text(
              utf8.decode(tweetDoc.tweet.toString().codeUnits),
              style: TextStyle(
                color: Colors.grey,
              ),
              textScaleFactor: 1.5,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            // TextField(),
            FloatingActionButton(
              elevation: 8.0,
              mini: true,
              tooltip: 'Reply',
              onPressed: () {},
              focusColor: Colors.blue,
              child: Icon(
                CustomIcons.send_3d,
                color: Colors.white,
              ),
            ),
          ]),
        ],
      ),
    ),
  );
}
