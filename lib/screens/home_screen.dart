import 'package:dutch_learning/widgets/collections_widget.dart';
import 'package:dutch_learning/widgets/saved_widget.dart';
import 'package:dutch_learning/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomSelectedIndex = 0;
  final controller = PageController(initialPage: 0);

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline, size: 30),
          title: Text("TODAY",
              style: TextStyle(height: 2, fontWeight: FontWeight.w500))),
      BottomNavigationBarItem(
          icon: Icon(Icons.library_books, size: 30),
          title: Text("Collections",
              style: TextStyle(height: 2, fontWeight: FontWeight.w500))),
      BottomNavigationBarItem(
          icon: Icon(Icons.bookmark, size: 30),
          title: Text('Saved',
              style: TextStyle(height: 2, fontWeight: FontWeight.w500)))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(color: primaryColor),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: primaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: secondaryColor.withOpacity(0.5),
                onTap: (index) {
                  bottomTapped(index);
                },
                currentIndex: bottomSelectedIndex,
                items: buildBottomNavBarItems())),
        body: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              bottomSelectedIndex = index;
            });
          },
          children: <Widget>[
            WelcomeWidget(),
            CollectionsWidget(),
            SavedWidget()
          ],
        ));
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
