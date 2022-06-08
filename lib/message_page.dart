import 'package:flutter/material.dart';
class MessagePage extends StatelessWidget {
  final VoidCallback openDrawer;
const MessagePage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed:openDrawer, icon: const Icon(Icons.menu,color: Colors.black,)),
        backgroundColor: Colors.white,
        title: const Text('Message Page',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
