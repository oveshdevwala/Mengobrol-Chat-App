// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';
import 'package:mangochatapp/mengobrol_ui/mainpage.dart';

class chat_colors {
  static Color received_text_colors = Color.fromARGB(106, 202, 192, 192);
  static Color sended_text_colors = Color(0xfffdc604);
}

class chat_ui extends StatelessWidget {
  chat_ui(
      {super.key,
      required this.name,
      required this.image,
      required this.cindex});
  String name;
  var cindex;
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatPageAppBar(context),
      bottomNavigationBar: ChatPageBottomNavigation(),
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
              received_messages_ui(
                  received_messages_index: 0, maxwidth: 150, name: name),
              SizedBox(height: 15),
              received_messages_ui(
                  received_messages_index: 1, maxwidth: 270, name: name),
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
                      fontWeightdot: FontWeight.w900)),
            ],
          )),
    );
  }

  AppBar ChatPageAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          // Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return mengobrol_uiapp();
            },
          ));
        },
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      title: Container(
          padding: EdgeInsets.only(top: 5),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Hero(
                tag: 'image${cindex}',
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(image),
                  backgroundColor: Colors.yellowAccent,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'name${cindex}',
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
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
    );
  }
}

class ChatPageBottomNavigation extends StatelessWidget {
  const ChatPageBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.add, color: Colors.black, size: 22)),
            SizedBox(
              width: 280,
              height: 40,
              child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none),
                      fillColor: Color(0xfff7f7f7),
                      filled: true,
                      hintText: 'New Chat',
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.mic, color: Colors.black87, size: 22))
          ],
        ),
      ),
    );
  }
}

customdialogmessage(context, {required String message}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (_, __, ___) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              alignment: Alignment.bottomCenter,
              // height: 250,
              // width: 300,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              padding: EdgeInsets.all(10),

              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                        height: 375,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            SizedBox(
                              width: 50,
                              child: Divider(
                                color: Color(0xffdedede),
                                height: 3,
                                thickness: 5,
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              padding: EdgeInsets.all(25),
                              margin: EdgeInsets.all(8),
                              child: Text(message),
                              decoration: BoxDecoration(
                                  color: Color(0xfff7f7f7),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "React",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 10),
                            ConstrainedBox(
                              // height: 40,
                              constraints: BoxConstraints(maxHeight: 40),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: emojisdata.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      // color: Colors.red,
                                      // height: 50, width: 50,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      child: Image.asset(
                                        emojisdata[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Copy",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  size: 18,
                                  Icons.copy,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            // Divider(
                            //   color: Color(0xffdedede),
                            //   height: 15,
                            //   thickness: 1,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Reply",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  CupertinoIcons.arrow_turn_up_left,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            // Divider(
                            //   color: Color(0xffdedede),
                            //   height: 15,
                            //   thickness: 1,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Forward",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.turn_right_rounded,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            // Divider(
                            //   color: Color(0xffdedede),
                            //   height: 15,
                            //   thickness: 1,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  CupertinoIcons.delete,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 15)
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class received_messages_ui extends StatelessWidget {
  received_messages_ui({
    super.key,
    required this.maxwidth,
    required this.received_messages_index,
    required this.name,
  });
  int maxwidth;
  String name;
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
                        children: [Text(name), Text('What should i call u?')],
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

class messages_text extends StatefulWidget {
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
  State<messages_text> createState() => _messages_textState();
}

class _messages_textState extends State<messages_text> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        customdialogmessage(context, message: widget.messagesindex);
        setState(() {});
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 270),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            widget.messagesindex,
            softWrap: true,
            style: TextStyle(
                height: 1.3,
                fontSize: widget.fontsize,
                fontWeight: widget.fontWeightdot),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.colorbool == 1
                ? chat_colors.received_text_colors
                : chat_colors.sended_text_colors,
          ),
        ),
      ),
    );
  }
}
