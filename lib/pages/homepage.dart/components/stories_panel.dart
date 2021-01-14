import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pages/storyview/story_view_page.dart';
import 'package:vrik_chatapp/pallete.dart';

class StoriesPanel extends StatelessWidget {
  final List<Story> story;
  const StoriesPanel({
    Key key,
    this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: mqHeight * 0.45,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: story.length,
        itemBuilder: (context, index) {
          Story story = stories[index];
          // if (index == 0) {
          //   return CircleAvatar();
          // }

          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return StoryViewPage();
                },
              ));
            },
            child: StoryCard(
              mqWidth: mqWidth,
              mqHeight: mqHeight,
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key key,
    @required this.mqWidth,
    this.mqHeight,
    this.story,
  }) : super(key: key);

  final double mqWidth;
  final double mqHeight;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: mqHeight * 0.3,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: mqWidth * 0.42,
              decoration: BoxDecoration(
                color: Pallete.evening,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: story.imageUrl,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Fontelico.spin1,
                          color: Pallete.primaryColorOne,
                        ),
                      ),
                      height: mqHeight * 0.3,
                      width: mqWidth * 0.42,
                      fit: BoxFit.cover,
                    ),
                  ),
                  story.isLive
                      ? Positioned(
                          right: mqWidth * 0.03,
                          top: mqHeight * 0.015,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Pallete.grad1,
                                  Pallete.grad2,
                                ],
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesome5.camera,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'LIVE',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: mqWidth * 0.42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1],
                  colors: [
                    Colors.transparent,
                    Colors.black38,
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Pallete.grad2,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Pallete.darkGrey,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: CachedNetworkImageProvider(
                      story.user.imageUrl,
                      scale: 20,
                    ),
                  )
                ],
              ),
              SizedBox(width: 8),
              Text(
                story.user.name,
                style: TextStyle(color: Pallete.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
