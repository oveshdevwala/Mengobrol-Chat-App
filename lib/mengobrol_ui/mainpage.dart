
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';

class ui_colors {
  static Color homebgcolor = Color(0xffffffff);
  static Color unreadcirclecolor = Color(0xfffdc604);

  static const _kFontFam = 'MyFlutterApp';

  static const String? _kFontPkg = null;
  static const IconData double_tick =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class mengobrol_uiapp extends StatelessWidget {
  const mengobrol_uiapp({super.key});

  get index => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui_colors.homebgcolor,
      appBar: AppBar(
        backgroundColor: ui_colors.homebgcolor,
        elevation: 0,
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
      ),
      body: Column(
        children: [
          status_bar_(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: chat_icons_row(),
          ),
          Expanded(
              // flex: 10,
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: contact_data.length,
                    itemExtent: 80,
                    itemBuilder: (context, index) {
                      return Chat_list(index);
                    },
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  ListTile Chat_list(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      minVerticalPadding: 10,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.yellow,
        backgroundImage: AssetImage(contact_data[index]['profileimage']),
      ),
      title: Text(
        contact_data[index]['name'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
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
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            // color: Colors.grey,
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
