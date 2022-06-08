import 'package:flutter/material.dart';

import 'drawer_menu_widget.dart';
class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;
  const HomePage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: DrawerMenuWidget(onClicked: openDrawer),
        backgroundColor: Colors.white,
        title: const Text('Home Page',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
