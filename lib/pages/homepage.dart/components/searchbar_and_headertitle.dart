import 'package:flutter/material.dart';
import 'package:vrik_chatapp/pallete.dart';

Container searchbarAndHadertitle(
    double mq, double mqHeight, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: mq / 4),
    height: mqHeight * 0.15,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'What\'s New',
            style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ],
    ),
  );
}
