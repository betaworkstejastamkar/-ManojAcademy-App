import 'package:flutter/material.dart';
import 'package:manojacademy/screens/home.dart';
import 'package:manojacademy/screens/livepage.dart';
import 'package:manojacademy/screens/searchpage.dart';
import 'package:manojacademy/screens/testpage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  String appBarTitle = 'Home';
  final screens = [
    const Home(),
    const SearchPage(),
    const LivePage(),
    const TestPage(),
  ];

  changeAppBarTitle({required int inDexNumber}) {
    switch (inDexNumber) {
      case 0:
        appBarTitle = 'Home';
        break;
      case 1:
        appBarTitle = 'Search';
        break;
      case 2:
        appBarTitle = 'Live';
        break;
      default:
        appBarTitle = 'Test';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? (Image.asset('navbaricons/selected/home.png'))
                : (Image.asset('navbaricons/unselected/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? (Image.asset('navbaricons/selected/search.png'))
                : (Image.asset('navbaricons/unselected/search.png')),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? (Image.asset('navbaricons/selected/live.png'))
                : (Image.asset('navbaricons/unselected/live.png')),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? (Image.asset('navbaricons/selected/test.png'))
                : (Image.asset('navbaricons/unselected/test.png')),
            label: 'Test',
          ),
        ],
        selectedFontSize: 20,
        unselectedFontSize: 20,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromRGBO(165, 153, 153, 1),
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          }),
          changeAppBarTitle(inDexNumber: _selectedIndex)
        },
      ),
    );
  }
}
