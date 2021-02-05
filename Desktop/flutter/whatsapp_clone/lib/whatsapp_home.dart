import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/Chat_screen/chat_screen.dart';
import 'package:whatsapp_clone/components/bottom_navigation.dart';
import 'package:whatsapp_clone/components/story_screen/story_screen.dart';
import 'package:whatsapp_clone/constants.dart';

class WhatsApp extends StatefulWidget {
  @override
  _WhatsAppState createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("WhatsApp"),
        backgroundColor: mainColor,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            StoryScreen(),
            ChatScreen(),
          ],
        ),
      ),
      floatingActionButton: BottomNavigation(tabController: _tabController),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
