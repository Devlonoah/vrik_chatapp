import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pallete.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    @required this.mqWidth,
    @required this.mqHeight,
    this.post,
    this.index,
  }) : super(key: key);

  final double mqWidth;
  final double mqHeight;
  final Post post;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: mqWidth * 0.03,
        left: mqHeight * 0.01,
        right: mqHeight * 0.01,
        bottom: post == posts.last ? mqHeight * 0.05 : mqHeight * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: mqWidth * 0.035,
        vertical: mqHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: Pallete.darkGrey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(-4, -4),
            spreadRadius: 3,
            blurRadius: 10,
            color: Colors.black38,
          ),
          BoxShadow(
            offset: Offset(4, 4),
            spreadRadius: 3,
            blurRadius: 10,
            color: Colors.black38,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Color(0xFF24272E),
            Color(0xFF222935),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),

          //if post contain media(video /picture  show it in grid)
          //if not show caption and tags

          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 13.0, bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      progressIndicatorBuilder: (context, url, progress) {
                        return Container(
                            height: mqHeight * 0.2,
                            child: Center(child: CircularProgressIndicator()));
                      },
                      errorWidget: (context, url, error) => Icon(
                          Fontelico.emo_cry,
                          color: Pallete.primaryColorOne),
                      width: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              : SizedBox.shrink(),
          post.tags != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    post.tags,
                    style: TextStyle(
                        color: Pallete.grad1, fontWeight: FontWeight.bold),
                  ),
                )
              : SizedBox.shrink(),
          post.caption != null
              ? Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 3),
                  child: Text(
                    post.caption,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
              : SizedBox.shrink(),

          PostReaction(mqHeight: mqHeight, post: post, mqWidth: mqWidth)
        ],
      ),
    );
  }
}

class PostReaction extends StatelessWidget {
  const PostReaction({
    Key key,
    @required this.mqHeight,
    @required this.post,
    @required this.mqWidth,
  }) : super(key: key);

  final double mqHeight;
  final Post post;
  final double mqWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: mqHeight * 0.0107),
      height: mqHeight * 0.09,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesome.heart,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                post.likes.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Pallete.white,
                  fontSize: 17,
                ),
              )
            ],
          ),
          SizedBox(
            width: mqWidth * 0.08,
          ),
          Row(
            children: [
              Icon(
                FontAwesome.comment,
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                post.comments.toString(),
                style: TextStyle(
                  color: Pallete.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              )
            ],
          ),
          userThatComment(post.userThatLikedPost)
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 23,
            backgroundImage: CachedNetworkImageProvider(post.user.imageUrl)),
        //user name and timeAgo since when added
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                post.user.name,
                style: TextStyle(
                    color: Pallete.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                post.timeAgo,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget userThatComment(List<User> noUserThatComment) {
  if (noUserThatComment.length == 1) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[0].imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }

  if (noUserThatComment.length == 2) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[0].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 20,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[1].imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
  if (noUserThatComment.length == 3) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[0].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 20,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[1].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 40,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[2].imageUrl),
              ),
            ),
          )
        ],
      ),
    );
  }

  if (noUserThatComment.length > 3) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[0].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 20,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[1].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 40,
            child: CircleAvatar(
              backgroundColor: Pallete.white,
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Pallete.darkGrey,
                backgroundImage:
                    CachedNetworkImageProvider(noUserThatComment[2].imageUrl),
              ),
            ),
          ),
          Positioned(
            right: 48,
            child: Icon(
              Icons.add,
              color: Pallete.primaryColorOne,
            ),
          ),
        ],
      ),
    );
  } else
    return SizedBox.shrink();
}
