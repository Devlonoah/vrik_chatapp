import 'package:flutter/material.dart';
import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pages/storyview/components/recommended_Card.dart';

class RecommendedStories extends StatelessWidget {
  const RecommendedStories({
    Key key,
    @required this.mqHeight,
    @required this.mqWidth,
  }) : super(key: key);

  final double mqHeight;
  final double mqWidth;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: mqHeight * 0.03,
      child: Container(
        height: mqHeight * 0.35,
        width: mqWidth,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: onlineUsers.length,
          itemBuilder: (context, index) {
            return RecommendedStoryCard(
              mqHeight: mqHeight,
              mqWidth: mqWidth,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
