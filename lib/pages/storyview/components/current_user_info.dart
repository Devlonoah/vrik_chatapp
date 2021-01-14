import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pallete.dart';

//This class contains widget of the user that uploaded
// current stories being watched
class CurrentUserInfo extends StatelessWidget {
  const CurrentUserInfo({
    Key key,
    @required this.mqWidth,
    this.currentIndex,
    this.name,
    this.time,
    this.imageUrl,
  }) : super(key: key);

  final double mqWidth;
  final int currentIndex;

  final String name;
  final String time;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    return Container(
      height: mqHeight * 0.09,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Pallete.white,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
          SizedBox(width: mqWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                CupertinoIcons.clear,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
