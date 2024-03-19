import 'package:flutter/material.dart';
import 'package:flutter_application_1/account.dart';
// import 'package:flutter_application_1/ai/chat_page.dart';
import 'package:flutter_application_1/fav_books.dart';
import 'package:flutter_application_1/myscreen.dart';
import 'package:flutter_application_1/user_profile.dart';
import 'package:flutter_application_1/widgets/app_colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myindex = 0; // Declare myindex variable
  final List<Widget> _pages = [
    const myscreen(),
    const FavBooks(),
    const myscreen(),
    const UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[myindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: tabVarViewColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        currentIndex: myindex,
        selectedIconTheme:
            IconThemeData(color: const Color.fromARGB(255, 0, 0, 0)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Your Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
