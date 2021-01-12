import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:vrik_chatapp/pages/homepage.dart/home_page.dart';
import 'package:vrik_chatapp/pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Pallete.scaffoldBackgroundColor,
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
            color: Pallete.primaryColorOne,
          ),
          headline2: TextStyle(
            color: Pallete.primaryColorOne,
          ),
          headline3: TextStyle(
            color: Pallete.primaryColorOne,
          ),
          headline4: TextStyle(
            color: Pallete.primaryColorOne,
          ),
          headline5: TextStyle(
            color: Pallete.primaryColorOne,
          ),
          headline6: TextStyle(
            color: Pallete.primaryColorOne,
          ),
        ),
      ),
      home: AppHome(),
      routes: {
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  AppHome({Key key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  List<Widget> screens = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int selectedIndex = 0;

  List<IconData> icons = [
    EvaIcons.home,
    EvaIcons.trash2Outline,
    Fontelico.emo_cry,
    EvaIcons.settings
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: IndexedStack(
          children: screens,
          index: selectedIndex,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [],
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
            icons: icons,
            selectedIndex: selectedIndex,
            onTap: (index) => setState(() => selectedIndex = index),
          ),
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function onTap;
  const CustomTabBar({
    Key key,
    this.icons,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          border: Border(
            top: BorderSide(color: Pallete.grad1, width: 3.0),
          ),
        ),
        unselectedLabelColor: Colors.grey,
        onTap: onTap,
        tabs: icons
            .asMap()
            .map(
              (key, e) => MapEntry(
                key,
                Tab(
                  icon: Icon(
                    e,
                    color: key == selectedIndex ? Colors.red : Colors.black,
                  ),
                ),
              ),
            )
            .values
            .toList());
  }
}
