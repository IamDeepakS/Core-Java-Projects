import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/Chat_screen/components/bottom_navigation.dart';
import 'package:whatsapp_clone/components/Chat_screen/components/message_box.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/model/messageModel.dart';

class ConversationScreen extends StatelessWidget {
  final String username, time, userPic;
  final bool online;

  const ConversationScreen({
    Key key,
    this.username,
    this.online,
    this.time,
    this.userPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.6)),
          ),
        ),
        leadingWidth: 30,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(userPic), fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    online
                        ? Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 1),
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Active Now",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          )
                        : Text(
                            time,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam, size: 20),
            color: mainColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, size: 20),
            color: mainColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, size: 20),
            color: mainColor,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: List.generate(
            messages.length,
            (index) {
              return MessageBox(
                isMe: messages[index]['isMe'],
                messageType: messages[index]['messageType'],
                message: messages[index]['message'],
              );
            },
          ),
        ),
      ),
      bottomSheet: BottomSendNavigation(),
    );
  }
}
