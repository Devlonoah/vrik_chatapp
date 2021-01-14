import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:vrik_chatapp/pallete.dart';
import 'components/profile_header.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var mqTop = MediaQuery.of(context).padding.top;
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;

    List<Widget> _screens = [
      RecentPost(),
      Scaffold(),
      Scaffold(),
      Scaffold(),
    ];

    List<IconData> _icons = [
      FontAwesome5.photo_video,
      FontAwesome5.amilia,
      FontAwesome5.stethoscope,
      FontAwesome5.angrycreative
    ];

    int selectedIndex = 0;
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            pinned: false,
            delegate: ProfileSilverHeader(
              minoExtent: mqHeight * 0.0,
              maxExtentValue: mqHeight * 0.33,
            ),
          ),
          // SliverToBoxAdapter(
          //   child:
          //       ProfileHeader(mqTop: mqTop, mqWidth: mqWidth, mqHeight: mqHeight),
          // ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: ProfileTabBar(
                  icons: _icons,
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              child: IndexedStack(
                index: selectedIndex,
                children: _screens,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileSilverHeader implements SliverPersistentHeaderDelegate {
  final double minoExtent;
  final double maxExtentValue;
  ProfileSilverHeader({
    this.minoExtent,
    this.maxExtentValue,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var mqTop = MediaQuery.of(context).padding.top;
    var mqHeight = MediaQuery.of(context).size.height;
    var mqWidth = MediaQuery.of(context).size.width;
    Offset widgetOffset = Offset(0, -shrinkOffset);
    return Transform.translate(
      offset: Offset(0, 10 - shrinkOffset),
      child: ProfileHeader(
        mqTop: mqTop,
        mqWidth: mqWidth,
        mqHeight: mqHeight,
        dx: widgetOffset.dx,
        dy: widgetOffset.dy,
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.maxExtentValue;

  @override
  // TODO: implement minExtent
  double get minExtent => this.minoExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider get vsync => null;
}

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar(
      {Key key,
      @required List<IconData> icons,
      @required this.selectedIndex,
      this.onTap})
      : _icons = icons,
        super(key: key);

  final List<IconData> _icons;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
      tabs: _icons
          .asMap()
          .map(
            (key, e) => MapEntry(
              key,
              Tab(
                icon: Icon(
                  e,
                  color: selectedIndex == key
                      ? Pallete.primaryColorOne
                      : Pallete.white,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

class RecentPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Text("$index");
      }, childCount: 10),
    );
  }
}

//TODO: FIX these online
