import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:vrik_chatapp/pallete.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.mqTop,
    @required this.mqWidth,
    @required this.mqHeight,
    @required this.dy,
    @required this.dx,
  }) : super(key: key);

  final double mqTop;
  final double mqWidth;
  final double mqHeight;
  final double dx, dy;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(dx, dy),
      child: Container(
        color: Pallete.night,
        // margin: EdgeInsets.only(top: mqTop / 1.2),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: mqWidth * 0.03),
        child: ListView(
          children: [
            buildEditProfileButton(),
            // SizedBox(
            //   height: mqHeight * 0.0,
            // ),
            ImageNameAndTag(
              mqWidth: mqWidth,
              mqHeight: mqHeight,
            ),
            SizedBox(
              height: mqHeight * 0.04,
            ),
            ActivityCounter(mqWidth: mqWidth, mqHeight: mqHeight)
          ],
        ),
      ),
    );
  }
}

Align buildEditProfileButton() {
  return Align(
    alignment: Alignment.centerRight,
    child: IconButton(
      icon: Icon(
        FontAwesome5.edit,
        color: Pallete.grad1,
      ),
      onPressed: () {},
    ),
  );
}

class ImageNameAndTag extends StatelessWidget {
  final double mqWidth;
  final double mqHeight;
  const ImageNameAndTag({Key key, this.mqWidth, this.mqHeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
        ),
        SizedBox(width: mqWidth * 0.04),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Angelina Jolie',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(
                height: mqHeight * 0.004,
              ),
              Text(
                '@jorgelin',
                style: TextStyle(
                  color: Pallete.white.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ActivityCounter extends StatelessWidget {
  final double mqWidth;
  final double mqHeight;
  final List<IconData> icons;

  const ActivityCounter({
    Key key,
    this.mqWidth,
    this.mqHeight,
    this.icons,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '128',
                style: TextStyle(color: Pallete.white, fontSize: 17),
              ),
              SizedBox(
                width: mqWidth * 0.02,
              ),
              Text(
                'Posts',
                style: TextStyle(color: Pallete.darkGrey, fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '3120',
                style: TextStyle(color: Pallete.white, fontSize: 17),
              ),
              SizedBox(
                width: mqWidth * 0.02,
              ),
              Text(
                'Following',
                style: TextStyle(color: Pallete.darkGrey, fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '5024',
                style: TextStyle(color: Pallete.white, fontSize: 17),
              ),
              SizedBox(
                width: mqWidth * 0.02,
              ),
              Text(
                'Follower',
                style: TextStyle(color: Pallete.darkGrey, fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
