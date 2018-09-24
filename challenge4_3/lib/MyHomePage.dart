import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //finalは一番上に置くことが多い
  final myController = TextEditingController();

  // プロパティはメソッドよりも上に置くこと
  List talkList = [
    "北海道",
    "青森県",
    "岩手県",
    "宮城県",
    "秋田県",
    "山形県",
    "福島県",
    "茨城県",
    "栃木県",
    "群馬県",
    "埼玉県",
    "千葉県",
    "東京都",
    "神奈川県",
  ];

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  itemCount: talkList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                      child: Text(
                        talkList[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 60.0,
              decoration: BoxDecoration(color: Colors.grey),
              alignment: AlignmentDirectional.bottomStart,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      controller: myController,
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: 60.0,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          talkList.add(myController.text);
                        });
                      },
                      child: Icon(Icons.text_fields),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
