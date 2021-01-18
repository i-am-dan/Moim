// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:intl/intl.dart';
import 'package:lcpc/sections.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color infoColor = Theme.of(context).primaryColor;
    var sunday = 7; // Sunday
    var date = new DateTime.now();
    var nextSunday = date.add(Duration(days: sunday - date.weekday));
    final Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Sign up for Sunday service:',
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Text(
                  new DateFormat.yMMMd().format(nextSunday),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Signup()
          /*3*/
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // Text('41'),
        ],
      ),
    );

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          {
            launch("tel://7182298855");
          }
          break;
        case 1:
          {
            MapsLauncher.launchQuery(
                '209-08 48th Ave, Oakland Gardens, NY 11364, USA');
          }
          break;
        default:
          break;
      }
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('MOIM'),
        backgroundColor: infoColor,
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/Lake-Pahoe.jpg',
            height: 175,
            fit: BoxFit.cover,
          ),
          titleSection,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call, color: Theme.of(context).primaryColor),
            label: 'CALL',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Theme.of(context).primaryColor),
            label: 'SERMONS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.batch_prediction,
                color: Theme.of(context).primaryColor),
            label: 'MISSION',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me, color: Theme.of(context).primaryColor),
            label: 'ROUTE',
          ),
        ],
        onTap: _onItemTapped,
      ),
      //backgroundColor: scaffoldBgColor,
    ));
  }
}

// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }

// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = TextStyle(fontSize: 18.0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Ministry Name Generator')),
//         body: _buildSuggestions());
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemBuilder: (context, i) {
//           if (i.isOdd) return Divider();

//           final index = i ~/ 2;
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
//   }
// }
