// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/chatMessageModel.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> messages = [
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 3, hours: 5)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1, days: 3, hours: 5)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1,hours: 15,days: 20)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true),
    ChatMessage(
        text: "Hello, Will",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    ChatMessage(
        text: "hi bro",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("imag/doctors/doctor1.jpeg"),
                  maxRadius: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Dr.Sara Ahmed",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                Image.asset("imag/logo1.png")
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<ChatMessage, DateTime>(
            padding: EdgeInsets.all(8),
            reverse: true,
            order: GroupedListOrder.DESC,
            useStickyGroupSeparators: true,
            floatingHeader: true,
            elements: messages,
            groupBy: (message) => DateTime(
              message.date.year,
              message.date.month,
              message.date.day,
            ),
            groupHeaderBuilder: (ChatMessage message) => SizedBox(
              height: 40,
              child: Center(
                child: Card(
                  color: Color.fromARGB(255, 84, 150, 84),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      DateFormat.yMMMd().format(message.date),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            itemBuilder: (context, ChatMessage message) => Align(
              alignment: message.isSentByMe
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Card(
                color: (message.isSentByMe
                    ? Color.fromARGB(255, 84, 201, 84)
                    : Colors.grey),
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    message.text,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white54,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 84, 201, 84),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                      onSubmitted: (text) {
                        final message = ChatMessage(
                            text: text, date: DateTime.now(), isSentByMe: true);

                        setState(() => messages.add(message));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 20,
                    ),
                    backgroundColor: Color.fromARGB(255, 84, 201, 84),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          )
          /*Container(
            color: Colors.grey[300],
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                hintText: "Type your message here.....",
              ),
              onSubmitted: (text) {
                final message = ChatMessage(
                    text: text, date: DateTime.now(), isSentByMe: true);

                setState(() => messages.add(message));
              },
            ),
          )*/
        ],
      ),
      /*Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Color.fromARGB(255, 84, 201, 84)),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 84, 201, 84),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Color.fromARGB(255, 84, 201, 84),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),*/
    );
  }
}
