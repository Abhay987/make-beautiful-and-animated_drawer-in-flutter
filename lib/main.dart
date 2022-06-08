import 'package:animated_drawer/drawer_item.dart';
import 'package:animated_drawer/message_page.dart';
import 'package:animated_drawer/setting_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'drawer_items.dart';
import 'drawer_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated_drawer',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromRGBO(21, 30, 61, 1),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late bool isDrawerOpen;
  late double scaleFactor;
  bool isDragging = false;
  DrawerItem item = DrawerItems.home;
  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void openDrawer() {
    setState(() {
      xOffset = 210;
      yOffset = 150;
      scaleFactor = 0.6;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          buildDrawer(),
          buildPage(),
        ],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: SizedBox(
        width: xOffset,
        child: DrawerWidget(onSelectedItem: (item) {
          switch (item) {
            case DrawerItems.logout:
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Logging Out')));
              return;
            default:
              setState(() {
                this.item = item;
              });
              closeDrawer();
          }
        }),
      ));
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }

          isDragging = false;
        },
        onTap: closeDrawer,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12
                    : Theme.of(context).primaryColor,
                child: AbsorbPointer(
                    absorbing: isDrawerOpen, child: getDrawerPage()),
              ),
            )),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.setting:
        return SettingPage(openDrawer: openDrawer);
      case DrawerItems.message:
        return MessagePage(openDrawer: openDrawer);
      case DrawerItems.home:
      default:
        return HomePage(openDrawer: openDrawer);
    }
  }
}
