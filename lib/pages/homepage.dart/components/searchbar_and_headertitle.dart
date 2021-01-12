import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pallete.dart';

Container searchbarAndHadertitle(
    {double mqTop,
    double mqWidth,
    double mqHeight,
    BuildContext context,
    User currentUser}) {
  return Container(
    margin: EdgeInsets.only(
      left: mqWidth * 0.03,
      right: mqWidth * 0.03,
      top: mqTop + 10,
      bottom: mqHeight * 0.01,
    ),
    height: mqHeight * 0.15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: mqHeight * 0.05,
          decoration: BoxDecoration(
              color: Pallete.darkGrey, borderRadius: BorderRadius.circular(40)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Pallete.white,
              ),
              SizedBox(
                width: 2,
              ),
              Expanded(
                child: TextField(
                  style: TextStyle(
                    color: Pallete.white,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Pallete.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'What\'s New',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
              ),
            ),
            //Profile dp
            CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                currentUser.imageUrl,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
