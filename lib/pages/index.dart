import 'package:doctor_client/models/doctor.dart';
import 'package:doctor_client/pages/list_page.dart';
import 'package:doctor_client/pages/settings_page.dart';
import 'package:doctor_client/pages/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/pizza.dart';
import 'details.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Doctor",
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: "slabo",
      ),
      home: CustomContainer(),
    );
  }
}

class CustomContainer extends StatefulWidget {
  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // firestore
    //     .collection('users')
    //     .document(currentUser.uid)
    // //     .setData(user.toMap(user));
    // Symptoms symptom = Symptoms(title: "fever", backgroundColor: "d54b1c");
    // Firestore.instance
    //     .collection('symptoms')
    //     .document('common-issues')
    //     .setData(symptom.toMap(symptom));
    // print('item added to database');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Doctor'),
      //   backgroundColor: Colors.orange[200],
      // ),
      // drawer: SlideDrawer(),
      body: PageView(
          controller: _pageController,
          children: <Widget>[
            HomePage(),
            ListPage(),
            SettingPage(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          }),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Colors.orange,
        backgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.message,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          _currentIndex = index;
          _pageController.jumpToPage(index);
        },
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeIn,
      ),
    );
  }
}

class SlideDrawer extends StatelessWidget {
  const SlideDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'Doctor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(Icons.notifications, color: Colors.white),
        onPressed: () {},
      ),
      title: Text("Appoint"),
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

  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xffffeaa7));
    return Scaffold(
      appBar: customAppBar(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: 'D',
                    style: GoogleFonts.portLligatSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: 'octors',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ]),
              ),
              SizedBox(
                height: 10.0,
              ),
              _doctorList(),
              Divider(
                height: 50.0,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: 'M',
                    style: GoogleFonts.portLligatSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: 'eds',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ]),
              ),
              _doctorList(),
              SizedBox(height: 30.0),
              Divider(
                height: 50.0,
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text: 'P',
                    style: GoogleFonts.portLligatSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: 'atients',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ]),
              ),
              _doctorList(),
              SizedBox(height: 30.0)
            ],
          ),
        ),
      ),
    );
  }

  List<Doctor> doctor = [
    Doctor(name: "Jethalal gada", description: "Some text"),
    Doctor(name: "Akshay kumar", description: "Some text"),
    Doctor(
        name: "Tony Stark",
        description:
            "Large Desctiption Large DesctiptionLarge Desctiption Large Desctiption "),
    Doctor(name: "fourth Doctor", description: "Some text"),
    Doctor(name: "Fifth Doctor", description: "Some text"),
  ];

  Widget _doctorList() {
    return Container(
      height: 250.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: doctor.length,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctxt, int i) {
            return Container(
              margin: EdgeInsets.only(right: 5.0),
              width: 210,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        doctor[i].name,
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      Divider(
                        height: 30.0,
                      ),
                      Text(
                        doctor[i].description,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String description;

  const DoctorCard({Key key, @required this.name, @required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: hp(13),
      // width: wp(100),
      padding: EdgeInsets.all(20),
      //margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          new BoxShadow(
              color: Colors.grey[100],
              blurRadius: 4.0,
              spreadRadius: 3.5,
              offset: Offset(0.0, 2)),
        ],
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(height: 5),
                        Text(description,
                            style: TextStyle(color: Colors.grey, fontSize: 16))
                      ],
                    )
                  ]),
            )
          ]),
    );
  }
}
