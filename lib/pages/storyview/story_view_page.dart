import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrik_chatapp/model/user.dart';
import 'components/animated_bar.dart';
import 'components/current_user_info.dart';

class StoryViewPage extends StatefulWidget {
  static String id = 'StoryViewPage';

  @override
  _StoryViewPageState createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController _animationController;
  Animation animation;

  final List<User> userList = onlineUsers;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _animationController = AnimationController(vsync: this);
    animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);

    _loadStory(user: stories.first, animatedToPage: false);
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _animationController.stop();
          _animationController.reset();

          setState(() {
            if (_currentIndex + 1 < stories.length) {
              _currentIndex++;
              _animationController.forward();
            } else {
              //out of bound -loop user
              //Navigator.pop can be used here

              print('the end');
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    var mqTop = MediaQuery.of(context).padding.top;
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;

    final Story currentStory = stories[_currentIndex];
    _pauseImageLoader() {
      if (!isPause) {
        _animationController.stop();
        isPause = true;
      } else {
        _animationController.forward();
        isPause = false;
      }
    }

    void _onTapDown(TapDownDetails details, User currentUser) {
      final double screenWidth = MediaQuery.of(context).size.width;
      final double dx = details.globalPosition.dx;

      if (dx < screenWidth / 3) {
        setState(() {
          if (_currentIndex - 1 >= 0) {
            _currentIndex--;
            _loadStory(user: stories[_currentIndex]);
          }
        });
      } else if (dx > 2 * screenWidth / 3) {
        setState(
          () {
            if (_currentIndex + 1 < userList.length) {
              _currentIndex++;
              _loadStory(user: stories[_currentIndex]);
            } else {
              _currentIndex = 0;
              // _loadStory(user: onlineUsers[_currentIndex]);
              setState(() {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('End of users list'),
                  ),
                );
              });
            }
          },
        );
      } else {}
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTapDown: (details) => _onTapDown(details, currentUser),
            onLongPressEnd: (dfd) {
              _pauseImageLoader();
            },
            onLongPressStart: (details) {
              _pauseImageLoader();
            },
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: onlineUsers.length,
              itemBuilder: (context, index) {
                final User user = onlineUsers[_currentIndex];
                final String image = user.imageUrl;
                return CachedNetworkImage(
                  imageUrl: currentStory.imageUrl,
                  height: mqHeight,
                  width: mqWidth,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: mqHeight * 0.06,
              left: mqWidth * 0.023,
              right: mqWidth * 0.023,
            ),
            child: CurrentUserInfo(
              mqWidth: mqWidth,
              currentIndex: _currentIndex,
              name: stories[_currentIndex].user.name,
              imageUrl: onlineUsers[_currentIndex].imageUrl,
              time: '01:08:30',
            ),
          ),
          //TODO: Add the below feature later(uncomment)
          // RecommendedStories(mqHeight: mqHeight, mqWidth: mqWidth)
          Container(
            height: mqHeight * 0.055,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black12,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black12,
                    ])),
          ),

          Positioned(
            top: mqHeight * 0.04,
            left: 10,
            right: 10,
            child: Stack(
              children: [
                Row(
                    children: stories
                        .asMap()
                        .map((key, value) => MapEntry(
                            key,
                            AnimatedBar(
                                animationController: _animationController,
                                position: key,
                                currentIndex: _currentIndex)))
                        .values
                        .toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

//this functio  for manual changing of users

//the automatic one is already inside initstate
  void _loadStory({Story user, bool animatedToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    _animationController.duration = Duration(seconds: 5);
    _animationController.forward();

    if (animatedToPage) {
      setState(() {
        _pageController.animateToPage(_currentIndex,
            duration: Duration(milliseconds: 1), curve: Curves.slowMiddle);
      });
    }
  }
}
