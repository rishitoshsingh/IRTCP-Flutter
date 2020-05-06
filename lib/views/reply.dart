import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/tweets.dart';
import '../strings.dart';

class Reply extends StatelessWidget {
  Documents tweet;
  Reply({this.tweet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reply'),
        ),
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'On ',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black54,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: DateFormat('MMMM d, y').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            tweet.timestamp.date.numberLong))) +
                                ', ',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '@' + tweet.username + ' ',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'tweeted : ',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black54,
                              ))
                        ]),
                  ),
                  Card(
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    elevation: 18.0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        utf8.decode(tweet.tweet.toString().codeUnits),
                        style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontFamily: 'Open Sans'),
                      ),
                    ),
                  )
                ],
              )),
        ]));
  }
}
