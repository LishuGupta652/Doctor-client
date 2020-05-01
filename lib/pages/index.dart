import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_client/models/symptoms.dart';
import 'package:doctor_client/pages/list_page.dart';
import 'package:doctor_client/pages/settings_page.dart';
import 'package:doctor_client/resources/firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

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
      appBar: AppBar(
        title: const Text('Doctor'),
        backgroundColor: Colors.orange[200],
      ),
      drawer: SlideDrawer(),
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
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xffffeaa7));
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 50, right: 30),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[titleBar(), tabs()],
            ),
          )
        ],
      ),
    );
  }
}

Widget titleBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            color: Colors.green,
            onPressed: () {
              FirebaseRepository repository = FirebaseRepository();
              repository.signOut();
            },
            child: Text("Log out"),
          ),
          Text(
            "Best",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
          ),
          Text("Doctors", style: TextStyle(fontSize: 50))
        ],
      )
    ],
  );
}

Widget tabs() {
  return Container(
    height: 300,
    width: double.infinity,
    child: DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                /*
                  safearea : A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
                  for more visit : https://www.youtube.com/watch?v=lkF0TQJO0bA
                */

                child: Column(
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.only(top: 15),
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          fontFamily: "slabo"),
                      unselectedLabelColor: Colors.black26,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w200,
                          fontFamily: "slabo"),
                      tabs: <Widget>[
                        Container(
                          child: Text("Common-issues"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Rheumatologist"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Neurologist"),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: Text("Psychiatrist"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            symptomsShowCase(),
            Center(
              child: Text(
                "General Practitioner. A general practitioner is trained to provide healthcare to patients of ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "A pediatrician is a doctor that specializes in childhood medicine, or those under 18. Some pediatricians will see their patients until they are 21.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: Text(
                "Endocrinologists specialize in glands and all the hormones they produce. Endocrinologists commonly treat diabetes, thyroid dysfunction, and reproductive health.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Symptoms> symptoms = [
  Symptoms(title: "fever"),
  Symptoms(title: "Diet and Nutrition"),
  Symptoms(title: "Skin And Hair"),
  Symptoms(title: "Diabetes"),
];

Widget symptomsShowCase() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: symptoms.length,
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.only(right: 30),
            height: 150,
            color: Colors.amber,
            child: Text(
              symptoms[i].title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          );
        },
      ));
}

Widget pizzaShowCase() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pizzaList.pizzas.length,
      itemBuilder: (BuildContext context, int i) {
        return ListOfPizzas(
          name: pizzaList.pizzas[i].name,
          image: pizzaList.pizzas[i].image,
          price: pizzaList.pizzas[i].price,
          background: pizzaList.pizzas[i].background,
          foreground: pizzaList.pizzas[i].foreground,
          pizzaObject: pizzaList.pizzas[i],
        );
      },
    ),
  );
}

class ListOfPizzas extends StatelessWidget {
  const ListOfPizzas(
      {@required this.foreground,
      @required this.background,
      @required this.price,
      @required this.name,
      @required this.image,
      @required this.pizzaObject});

  final Color foreground;
  final Color background;
  final double price;
  final String name;
  final String image;
  final Pizza pizzaObject;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Details(pizzaObject)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            width: 225,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 180,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                      style: TextStyle(
                          color: foreground, fontSize: 25, fontFamily: "slabo"),
                      children: [
                        TextSpan(text: name),
                        TextSpan(
                            text: "\nPizza",
                            style: TextStyle(fontWeight: FontWeight.w800))
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\$$price",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: foreground,
                              fontFamily: "arial")),
                    ),
                    StatefulFavIcon(
                      foreground: foreground,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}

class StatefulFavIcon extends StatefulWidget {
  const StatefulFavIcon({@required this.foreground});

  final Color foreground;

  @override
  _StatefulFavIconState createState() => _StatefulFavIconState();
}

class _StatefulFavIconState extends State<StatefulFavIcon> {
  bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: widget.foreground,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double _size = 60;
  final double _padding = 17;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: _size + 15,
              width: _size + 15,
              padding: EdgeInsets.all(_padding),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://yt3.ggpht.com/a-/ACSszfFz08Hdnl2SLB14PhBWwCLE72djU4N19ACaoA=s900-mo-c-c0xffffffff-rj-k-no",
                    fit: BoxFit.contain),
                /*
                    it just shows my image, you can put any image of you choice or use
                    Image.asset(
                      child: <IMAGE_DESTINATION>,
                      fit: BoxFit.contain
                    )
                  */
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/home_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              child: Image.asset(
                "assets/search_icon.png",
                fit: BoxFit.contain,
              ),
            ),
            Container(
              height: _size,
              width: _size,
              padding: EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                "assets/bag_icon.png",
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
