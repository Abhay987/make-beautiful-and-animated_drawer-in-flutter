import 'package:animated_drawer/drawer_item.dart';
import 'package:flutter/material.dart';
class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.home);
  static const setting = DrawerItem(title: 'Setting', icon: Icons.settings);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout);
  static const message = DrawerItem(title: 'Message', icon: Icons.message);
  static final List<DrawerItem> all = [home,message,setting,logout];
}