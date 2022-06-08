import 'package:animated_drawer/drawer_item.dart';
import 'package:animated_drawer/drawer_items.dart';
import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({Key? key, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
              buildDrawerItems(context),
          ],
        ),
      ),
    );
  }
    Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: DrawerItems.all.map((item) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
        leading: Icon(item.icon,color: Colors.white,),
        title: Text(item.title,style: const TextStyle(color: Colors.white,fontSize: 20),),
        onTap: (){onSelectedItem(item);
        },
      )).toList(),
    );
    }
}
