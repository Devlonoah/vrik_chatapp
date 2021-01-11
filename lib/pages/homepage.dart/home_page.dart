import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrik_chatapp/pallete.dart';

import 'components/searchbar_and_headertitle.dart';
import 'components/stories_panel.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).padding.top;
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        searchbarAndHadertitle(
            mqTop: mq, mqWidth: mqWidth, mqHeight: mqHeight, context: context),
        SizedBox(height: mqHeight * 0.03),
        StoriesPanel(),
        SizedBox(height: mqHeight * 0.03),
        Container(
          margin: EdgeInsets.symmetric(horizontal: mqWidth * 0.03),
          padding: EdgeInsets.symmetric(
            horizontal: mqWidth * 0.02,
            vertical: mqHeight * 0.02,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: mqHeight * 0.06,
                    width: mqWidth * 0.13,
                    decoration: BoxDecoration(
                      color: Pallete.grad1,
                      shape: BoxShape.circle,
                    ),
                  ),
                  //user name and timeAgo since when added
                  SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thomas Payne',
                        style: TextStyle(
                            color: Pallete.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "2hours ago",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
