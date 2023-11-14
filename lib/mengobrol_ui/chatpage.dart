// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';

class chat_colors {
  static Color received_text_colors = Color.fromARGB(106, 202, 192, 192);
  static Color sended_text_colors = Color(0xfffdc604);
}

class chat_ui extends StatelessWidget {
  const chat_ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
        title: Container(
            padding: EdgeInsets.only(top: 5),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(contact_data[1]['profileimage']),
                  backgroundColor: Colors.yellowAccent,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zaire Dorwart',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Online',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            )),
        actions: [
          Icon(
            CupertinoIcons.video_camera,
            color: Colors.black,
            size: 35,
          ),
          SizedBox(width: 20),
          Icon(
            CupertinoIcons.phone,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Today",
                    style: TextStyle(color: Colors.grey),
                  )),
              SizedBox(height: 15),
              messages_text(colorbool: 1, messagesindex: received_messages[0]),
              SizedBox(height: 15),
              messages_text(colorbool: 1, messagesindex: received_messages[1]),
              SizedBox(height: 15),
              messages_text(colorbool: 1, messagesindex: received_messages[2]),
              SizedBox(height: 15),
              SizedBox(height: 15),
              received_messages_ui(received_messages_index: 0, maxwidth: 150),
              SizedBox(height: 15),
              received_messages_ui(received_messages_index: 1, maxwidth: 270),
              SizedBox(height: 15),
              Container(
                  alignment: Alignment.bottomRight,
                  child:
                      Text('Deilvered', style: TextStyle(color: Colors.grey))),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: messages_text(
                    messagesindex: '.･.･',
                    colorbool: 1,
                    fontsize: 20,
                    fontWeightdot: FontWeight.w900,
                  )),
            ],
          )),
    );
  }
}

class received_messages_ui extends StatelessWidget {
  
  received_messages_ui({
    super.key,
    required this.maxwidth,
    required this.received_messages_index,
  });
  int maxwidth;
  int received_messages_index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 260,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: chat_colors.sended_text_colors,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxwidth.toDouble()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  // color: Colors.white,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        color: Colors.black,
                        width: 1,
                      ),
                      SizedBox(width: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Zaire Dorwart'),
                          Text('What should i call u?')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxwidth.toDouble()),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: messages_text(
                      colorbool: 2,
                      messagesindex: send_messages[received_messages_index],
                      messagecolor: chat_colors.sended_text_colors),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class messages_text extends StatelessWidget {
  String messagesindex;
  int colorbool;
  double fontsize;
  FontWeight fontWeightdot;
  Color? messagecolor = chat_colors.received_text_colors;
  messages_text(
      {super.key,
      this.fontWeightdot = FontWeight.normal,
      this.fontsize = 13,
      required this.messagesindex,
      this.messagecolor,
      required this.colorbool});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 270),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          messagesindex,
          softWrap: true,
          style: TextStyle(
              height: 1.3, fontSize: fontsize, fontWeight: fontWeightdot),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorbool == 1
              ? chat_colors.received_text_colors
              : chat_colors.sended_text_colors,
        ),
      ),
    );
  }
}










// Expanded(flex: 1, child: Container(color: Colors.blue)),
//         SizedBox(width: 20),
//         Expanded(
//           flex: 4,
//           child: Container(
//             child: Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundColor: Colors.yellow,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//             flex: 2,
//             child: Container(
//               color: Colors.red,
//             ))
