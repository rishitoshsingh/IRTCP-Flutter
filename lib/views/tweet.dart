import 'package:flutter/material.dart';
import 'package:hello/presentation/custom_icons_icons.dart';

class Tweet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(24.0),
                    child: Icon(
                      CustomIcons.twitter,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 48.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 30.0,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '@IndianRailways ',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
                child: TextField(
                  autocorrect: true,
                  maxLength: 240,
                  maxLines: 9,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.send,
                  textCapitalization: TextCapitalization.sentences,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration.collapsed(hintText: 'Your Tweet'),
                  style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                      fontFamily: 'Open Sans'),
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {},
                  backgroundColor: Colors.deepOrangeAccent[200],
                  label: Text('Send'),
                  icon: Icon(
                    CustomIcons.send,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
