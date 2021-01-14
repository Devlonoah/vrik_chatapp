import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vrik_chatapp/model/user.dart';
import 'package:vrik_chatapp/pages/storyview/story_view_page.dart';
import 'components/posts.dart';
import 'components/searchbar_and_headertitle.dart';
import 'components/stories_panel.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).padding.top;
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: searchbarAndHadertitle(
              mqTop: mq,
              mqWidth: mqWidth,
              mqHeight: mqHeight,
              context: context,
              currentUser: currentUser),
        ),
        SliverToBoxAdapter(
          child: StoriesPanel(
            story: stories,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(mqHeight * 0.01),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return PostCard(
                mqWidth: mqWidth,
                mqHeight: mqHeight,
                post: posts[index],
                index: index);
          }, childCount: posts.length),
        )
      ],
    );
  }
}
