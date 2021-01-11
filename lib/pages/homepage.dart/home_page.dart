import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/searchbar_and_headertitle.dart';

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
        searchbarAndHadertitle(mq, mqHeight, context),
        SizedBox(height: mqHeight * 0.03),
        StoriesPanel()
      ],
    );
  }
}

class StoriesPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mqHeight * 0.3,
      width: double.infinity,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          // if (index == 0) {
          //   return CircleAvatar();
          // }

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: mqWidth * 0.4,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
