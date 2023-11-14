import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/chatpage.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';

class ui_colors {
  static const IconData assignment_ind_outlined =
      IconData(0xee96, fontFamily: 'MaterialIcons');

  static Color homebgcolor = Color(0xffffffff);
  static Color dialogwhite = Color(0xffeeeeee);
  static Color unreadcirclecolor = Color(0xfffdc604);

  static const _kFontFam = 'MyFlutterApp';

  static const String? _kFontPkg = null;
  static const IconData double_tick =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

var selectednav = 0;

class mengobrol_uiapp extends StatefulWidget {
  mengobrol_uiapp({super.key});

  @override
  State<mengobrol_uiapp> createState() => _mengobrol_uiappState();
}

customdialog(context) {
  showGeneralDialog(
    barrierDismissible: false,
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
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              // padding: EdgeInsets.all(10),

              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.message_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              title: Text(
                                'New Chat',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Send a message to your contact',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  ui_colors.assignment_ind_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              title: Text(
                                'New Contact',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Add a contact to be able to send messages',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.group_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              title: Text(
                                'New Community',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Join the community around you',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: ui_colors.dialogwhite),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    )
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

class _mengobrol_uiappState extends State<mengobrol_uiapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui_colors.homebgcolor,
      appBar: HomePageAppBAr(),
      bottomNavigationBar: HomepageBottomNavigation(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            status_bar_(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: chat_icons_row(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HomePageContactList(),
            )
          ],
        ),
      ),
    );
  }

  HomePageContactList() {
    return Container(
      child: ListView.builder(
        itemCount: contact_data.length,
        itemExtent: 80,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          chat_ui(
                              cindex: index,
                              name: contact_data[index]['name'],
                              image: contact_data[index]['profileimage']),
                    ));
              },
              child: Chat_list(index));
        },
      ),
    );
  }

  AppBar HomePageAppBAr() {
    return AppBar(
      backgroundColor: ui_colors.homebgcolor,
      elevation: 0,
      leadingWidth: 0,
      title: Text(
        'Mengobrol',
        style: TextStyle(color: Colors.black, fontSize: 23),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 35,
          ),
        ),
      ],
    );
  }

  BottomNavigationBar HomepageBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectednav,
        onTap: (value) {
          selectednav = value;
          setState(() {});
        },
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              label: '',
              icon: InkWell(
                onTap: () {
                  customdialog(context);

                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "New Chat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.grey,
              ),
              label: '')
        ]);
  }

// contact_data[1]['profileimage']
  ListTile Chat_list(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 10,
      leading: Hero(
        tag: 'image${index}',
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.yellow,
          backgroundImage: AssetImage(contact_data[index]['profileimage']),
        ),
      ),
      title: Hero(
        tag: 'name${index}',
        child: Text(
          contact_data[index]['name'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(
        contact_data[index]['message'],
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12.5,
            color: contact_data[index]['readUndread'] == ''
                ? Colors.black54
                : Colors.black,
            fontWeight: contact_data[index]['readUndread'] == ''
                ? FontWeight.normal
                : FontWeight.w500),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('02.11'),
          SizedBox(height: 5),
          CircleAvatar(
            radius: contact_data[index]['readUndread'] == '' ? 0 : 10,
            child: Text(
              contact_data[index]['readUndread'],
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: ui_colors.unreadcirclecolor,
          )
        ],
      ),
    );
  }

  Container status_bar_() {
    return Container(
      height: 130,
      child: ListView.builder(
        itemCount: status_data.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return index == 0
              ? status_bar_ui(
                  statusimage: status_data[index]['profile'],
                  plusicon: Icon(
                    index == 0 ? (Icons.add) : Icons.add,
                    size: index == 0 ? 35 : 0,
                  ),
                  name: index == 0 ? "Add Story" : status_data[index]['name'],
                  Color: index == 0 ? Colors.white : Colors.redAccent)
              : status_bar_ui(
                  statusimage: status_data[index]['profile'],
                  plusicon: Icon(
                    index == 0 ? (Icons.add) : Icons.add,
                    size: index == 0 ? 35 : 0,
                  ),
                  name: index == 0 ? "Add Story" : status_data[index]['name'],
                  Color: index == 0 ? Colors.white : Colors.redAccent);
        },
      ),
    );
  }

  Container chat_icons_row() {
    return Container(
      // color: Colors.redAccent,
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.redAccent,
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: 15),
            child: Stack(children: [
              Text(
                '...',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Container profilecontainer_listview() {
    return Container(
      height: 75,
      width: 75,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }

  Container status_bar_ui(
      {Color = Colors.teal,
      required String name,
      required Icon plusicon,
      required String statusimage}) {
    return Container(
      height: 140,

      // color: Colors.yellowAccent,

      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: plusicon,
            height: 80,
            width: 80,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color,
              image: Color == Colors.white
                  ? DecorationImage(
                      image: AssetImage('assets/profile/profile1.jpg'),
                      opacity: 0)
                  : DecorationImage(
                      image: AssetImage(statusimage), fit: BoxFit.cover),
              border: Border.all(
                  color: Colors.black26, width: 1, style: BorderStyle.solid),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 5),
          Container(
              padding: EdgeInsets.only(left: 10),
              // alignment: Alignment.topCenter,
              child: Text(
                name,
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}
