import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatHome extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return  ChatScreenState();
  }
}

class ChatScreenState extends State<ChatHome> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: dummyList.length,
      itemBuilder: (context, i) =>  Column(
        children: <Widget>[
          Divider(
            height: 12.0,
          ),
          ListTile(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen(dummyList[i].name))),
            leading:  CircleAvatar(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage:  NetworkImage(dummyList[i].avatarUrl),
            ),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dummyList[i].name,
                  style:  TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  dummyList[i].time,
                  style:  TextStyle(color: Colors.grey, fontSize: 13.0),
                ),
              ],
            ),
            subtitle:  Container(
              padding: const EdgeInsets.only(top: 5.0),
              child:  Text(
                dummyList[i].message,
                style:  TextStyle(color: Colors.black, fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class ChatList {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatList({this.name, this.message, this.time, this.avatarUrl});

}


// for testing purposes
List<ChatList> dummyList = [
  ChatList(
      name: "Muhammad Khizar",
      message: "Hi Zayan",
      time: "01:00",
      avatarUrl:
      "https://w7.pngwing.com/pngs/931/256/png-transparent-bitstrips-avatar-emoji-graphy-emoticon-avatar-face-heroes-photography.png"),
  ChatList(
      name: "Zayan",
      message: "Hi!!!",
      time: "06:50",
      avatarUrl:
      "https://w7.pngwing.com/pngs/931/256/png-transparent-bitstrips-avatar-emoji-graphy-emoticon-avatar-face-heroes-photography.png"),
  ChatList(
      name: "Deeb",
      message: "What??",
      time: "7:11",
      avatarUrl:
      "https://w7.pngwing.com/pngs/931/256/png-transparent-bitstrips-avatar-emoji-graphy-emoticon-avatar-face-heroes-photography.png"),
];