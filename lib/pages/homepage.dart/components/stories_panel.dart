import 'package:flutter/material.dart';
import 'package:vrik_chatapp/pallete.dart';

class StoriesPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mqHeight * 0.4,
      width: double.infinity,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          // if (index == 0) {
          //   return CircleAvatar();
          // }

          return StoryCard(
            mqWidth: mqWidth,
            mqHeight: mqHeight,
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
  }) : super(key: key);

  final double mqWidth;
  final double mqHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: mqHeight * 0.3,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: mqWidth * 0.42,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: mqWidth * 0.03,
                      top: mqHeight * 0.015,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 70,
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
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 15,
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: Pallete.grad1,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Pallete.darkGrey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      color: Pallete.grad2,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              SizedBox(width: 8),
              Text(
                'Thomas Payne',
                style: TextStyle(color: Pallete.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
