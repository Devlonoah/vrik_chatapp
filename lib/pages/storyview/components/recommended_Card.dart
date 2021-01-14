import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vrik_chatapp/model/user.dart';

class RecommendedStoryCard extends StatelessWidget {
  const RecommendedStoryCard({
    Key key,
    @required this.mqHeight,
    @required this.mqWidth,
    this.index,
  }) : super(key: key);

  final double mqHeight;
  final double mqWidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: mqHeight * 0.3,
      width: mqWidth * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Colors.white, width: 2.0),
        image: DecorationImage(
            image: CachedNetworkImageProvider(onlineUsers[index].imageUrl),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            top: mqHeight * 0.009,
            right: mqWidth * 0.03,
            child: Text(
              '07:45',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: mqHeight * 0.009,
            left: mqWidth * 0.03,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      onlineUsers[random.nextInt(onlineUsers.length - 1)]
                          .imageUrl),
                ),
                SizedBox(width: mqWidth * 0.015),
                Text(
                  onlineUsers[index].name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
