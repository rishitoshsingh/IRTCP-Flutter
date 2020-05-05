import 'package:flutter/material.dart';
import 'package:hello/presentation/custom_icons_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:google_fonts/google_fonts.dart';

import './models/tweets.dart';
import './strings.dart';
import 'package:flutter/foundation.dart';

Future<Tweets> fetchDocuments() async {
  final response = await http.get(
      'https://webhooks.mongodb-stitch.com/api/client/v2.0/app/irtcp-qsdyo/service/getData/incoming_webhook/webhook0?collection=emergency');

  if (response.statusCode == 200) {
    return Tweets.fromJson(json.decode(response.body));
  } else {
    throw Exception('Can\'t Connect');
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<Tweets> futureDocuments;

  @override
  void initState() {
    super.initState();
    futureDocuments = fetchDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text(Strings.appTitle),
      // ),
      body: Center(
        child: FutureBuilder(
          future: futureDocuments,
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'New Tweet',
        // label: Text('New Tweet'),
        child: Icon(CustomIcons.twitter_logo_whiteonimage),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              color: Colors.blue,
              tooltip: 'Home',
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30.0,
              color: Colors.grey,
              tooltip: 'Replied',
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(Icons.done),
              onPressed: () {},
            ),
          ],
        ),
        color: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
      ),
    );
  }

  Widget getTweetView(Documents tweetDoc) {
    return Dismissible(
      key: Key(tweetDoc.tweetId),
      direction: DismissDirection.horizontal,
      background: Container(color: Colors.red),
      secondaryBackground: Container(
        child: Text('Hello'),
      ),
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
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
                    // backgroundImage: NetworkImage(tweetDoc.profileImageUrl),
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
            Row(children: <Widget>[
              // TextField(),
              RaisedButton.icon(
                elevation: 8.0,
                color: Colors.blue,
                onPressed: () {},
                focusColor: Colors.blue,
                icon: Icon(
                  CustomIcons.twitter_logo_whiteonimage,
                  color: Colors.white,
                ),
                label: Text(
                  'Reply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
