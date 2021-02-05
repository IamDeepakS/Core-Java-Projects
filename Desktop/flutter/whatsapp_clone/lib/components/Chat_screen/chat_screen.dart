import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/Chat_screen/Conversation_screen.dart';
import 'package:whatsapp_clone/constants.dart';
import 'package:whatsapp_clone/model/chatModel.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: containerRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationScreen(
                          username: dummyData[i].name,
                          online: dummyData[i].online,
                          time: dummyData[i].time,
                          userPic: dummyData[i].avatarUrl,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      dummyData[i].avatarUrl,
                    ),
                    radius: 26,
                    child: dummyData[i].online
                        ? Container(
                            margin:
                                const EdgeInsets.only(bottom: 40, right: 40),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.white),
                            ),
                          )
                        : Container(),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        dummyData[i].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      new Text(
                        dummyData[i].time,
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          if (dummyData[i].seen)
                            Icon(
                              Icons.done_all,
                              size: 18,
                              color: Colors.blue[600],
                            ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              dummyData[i].message,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          if (!dummyData[i].seen)
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: mainColor,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  indent: 70,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
