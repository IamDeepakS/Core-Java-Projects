import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chatModel.dart';

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xFF3B9889),
                      child: Icon(Icons.add, color: Colors.white, size: 25),
                      radius: 26,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Add Status",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  dummyData.length,
                  (i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Column(
                        children: [
                          dummyData[i].seen
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 26,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF3B9889),
                                    backgroundImage:
                                        NetworkImage(dummyData[i].avatarUrl),
                                    radius: 26,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Colors.green,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF3B9889),
                                    backgroundImage:
                                        NetworkImage(dummyData[i].avatarUrl),
                                    radius: 24,
                                  ),
                                ),
                          SizedBox(height: 5),
                          Text(
                            dummyData[i].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
