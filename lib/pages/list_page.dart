import 'package:doctor_client/pages/UI/please_show_login.dart';
import 'package:doctor_client/pages/widgets/appbar.dart';
import 'package:doctor_client/pages/widgets/custom_tile.dart';
import 'package:doctor_client/resources/firebase_repository.dart';
import 'package:doctor_client/utils/universal_variables.dart';
import 'package:doctor_client/utils/utilities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

final FirebaseRepository _repository = FirebaseRepository();

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xfffab1a0));
    return FutureBuilder(
      future: _repository.getCurrentUser(),
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          return ChatListScreen();
        } else {
          return ChatListScreen();
          // return PleaseShowLoginSignup();
        }
      },
    );
  }
}

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String currentUserId;
  String initials;

  @override
  void initState() {
    super.initState();
    _repository.getCurrentUser().then((user) {
      setState(() {
        currentUserId = user.uid;
        initials = Utils.getInitials(user.displayName);
      });
    });
  }

  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(Icons.notifications, color: Colors.white),
        onPressed: () {},
      ),
      title: UserCircle(initials == null ? "AZ" : initials),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ChatListContainer(currentUserId),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  final String currentUserId;
  ChatListContainer(this.currentUserId);

  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 12,
        itemBuilder: (context, index) {
          return CustomTile(
              mini: false,
              onTap: () {},
              title: Text(
                "Lishu gupta",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Arial', fontSize: 19),
              ),
              subtitle: Text(
                "Hey there! how are you.",
                style: TextStyle(
                    color: Colors.grey, fontFamily: 'Arial', fontSize: 14),
              ),
              leading: Container(
                constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage("assets/profile.png"),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class UserCircle extends StatelessWidget {
  final String text;

  UserCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: UniversalVariables.lightBlueColor,
                  fontSize: 13,
                ),
              )),
        ],
      ),
    );
  }
}
